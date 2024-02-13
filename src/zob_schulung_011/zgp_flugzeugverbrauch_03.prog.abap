*&---------------------------------------------------------------------*
*& Report zgp_flugzeugverbrauch_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgp_flugzeugverbrauch_03.

**********************************************************************
* SelectionScreen, damit der Nutzer mit 3 Parametern einen bestimmten Flug auswählen kann
* und um dem Nutzer die vorhandenen Flüge anzeigen zu können
**********************************************************************
START-OF-SELECTION.
  TABLES sflight.
  SELECTION-SCREEN BEGIN OF SCREEN 100 TITLE TEXT-001 AS WINDOW.
    SELECT
     FROM sflight LEFT JOIN spfli ON sflight~connid = spfli~connid
     FIELDS
     sflight~carrid,
     sflight~connid,
     sflight~fldate,
     spfli~cityfrom,
     spfli~cityto
     WHERE fldate IS NOT INITIAL
     INTO TABLE @DATA(lt_fldate).
    cl_demo_output=>display( lt_fldate ).
    PARAMETERS: p_connid TYPE sflight-connid OBLIGATORY,
                p_carrid TYPE sflight-carrid OBLIGATORY,
                p_fldate TYPE sflight-fldate OBLIGATORY,
                p_preis  TYPE p DECIMALS 2.
  SELECTION-SCREEN END OF SCREEN 100.

  CALL SELECTION-SCREEN 100 USING SELECTION-SET 100.


**********************************************************************
* Es werden Daten aus den Tabellen SAPLANE, SFLIGHT und SPFLI abgerufen und in der Strktur gs_spfli gespeichert
* Die Anzahl der belegten Sitzplätze wird summiert
**********************************************************************
  SELECT SINGLE
     FROM saplane
     JOIN sflight ON saplane~planetype = sflight~planetype
     JOIN spfli ON sflight~carrid = spfli~carrid AND sflight~connid = spfli~connid
     FIELDS
     spfli~connid,
     spfli~carrid,
     saplane~consum AS verbrauch_kg,
     saplane~planetype,
     spfli~distance AS flugdistanz,
     spfli~fltime AS flugzeit,
     spfli~distid AS flugdistanzID,
SUM( sflight~seatsocc ) AS seatsocc,
SUM( sflight~seatsocc_b ) AS seatsocc_b,
SUM( sflight~seatsocc_f ) AS seatsocc_f,
SUM( sflight~seatsocc + sflight~seatsocc_b + sflight~seatsocc_f ) AS totalSumOcc
     WHERE sflight~connid = @p_connid
     AND sflight~carrid = @p_carrid
     AND sflight~fldate = @p_fldate
GROUP BY spfli~connid,
     spfli~carrid,
     saplane~consum,
     saplane~planetype,
     spfli~distance,
     spfli~fltime,
     sflight~carrid,
     spfli~distid
  INTO @DATA(gs_spfli).


**********************************************************************
* Klasse wird im Report implementiert
**********************************************************************
  DATA lv_verbrauch TYPE p DECIMALS 3.
  DATA lv_kosten TYPE p DECIMALS 2.

  DATA gv_verbrauch_in_kg TYPE REF TO z_gp_verbrauch_in_kg.

  gv_verbrauch_in_kg = NEW #( ).

  gv_verbrauch_in_kg->get_verbrauch(
    EXPORTING
      iv_flugzeit     = gs_spfli-flugzeit
      iv_verbrauch_kg = gs_spfli-verbrauch_kg
      iv_totalsumocc  = gs_spfli-totalsumocc
    IMPORTING
      ev_verbrauch    = lv_verbrauch
  ).


  IF sy-subrc = 0 AND lv_verbrauch IS NOT INITIAL.
    WRITE: icon_green_light, |Für die Distanz von { gs_spfli-flugdistanz } { gs_spfli-flugdistanzid } verbraucht dieser Flug { lv_verbrauch } Kilogramm Kerosin.| .
    ULINE.
    IF p_preis IS NOT INITIAL.
      lv_kosten = p_preis * lv_verbrauch.
      WRITE: / icon_green_light, |Für diesen Verbrauch entstehen Kosten in Höhe von { lv_kosten } Euro.|.
    ENDIF.
  ELSE.
    DATA(lv_message) = |{ icon_red_light } Diesen Flug gibt es nicht!|.
    MESSAGE lv_message TYPE 'I'.
  ENDIF.
