*& Report zob_od_projekt_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_projekt_01.

**********************************************************************
* SelectionScreen, damit der Nutzer mit 3 Parametern einen bestimmten Flug auswählen kann
* und um dem Nutzer die vorhandenen Flüge anzeigen zu können
**********************************************************************
START-OF-SELECTION.
  TABLES sflight.

  TYPES: BEGIN OF ty_values,
           lv_carrid TYPE sflight-carrid,
           lv_connid TYPE sflight-connid,
           lv_fdate  TYPE sflight-fldate,
         END OF ty_values.
  DATA: lt_fldate TYPE TABLE OF ty_values,
        lv_values TYPE ty_values.

  SELECTION-SCREEN BEGIN OF SCREEN 100 TITLE TEXT-001 AS WINDOW.

    SELECT
     FROM sflight JOIN spfli ON sflight~connid = spfli~connid and spfli~carrid = sflight~carrid
     FIELDS
     sflight~carrid AS Airline-code,
     sflight~connid AS Verbindungsnummer,
     sflight~fldate AS Flugdatum
   WHERE fldate IS NOT INITIAL
     INTO TABLE @lt_fldate.

    PARAMETERS: p_carrid TYPE sflight-carrid OBLIGATORY,
                p_connid TYPE sflight-connid OBLIGATORY,
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
    IF p_preis IS NOT INITIAL.
      lv_kosten = p_preis * lv_verbrauch.
      WRITE: / icon_green_light, |Für diesen Verbrauch entstehen Kosten von { lv_kosten } Euro.|.
    ENDIF.
  ELSE.
    DATA(lv_message) = |{ icon_red_light } Diesen Flug gibt es nicht!|.
    MESSAGE lv_message TYPE 'I'.
  ENDIF.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_fldate.
  PERFORM display_value_help CHANGING p_fldate.

* Unterprogramm, das einen Wertehelp für p_value zeigt
FORM display_value_help CHANGING p_val TYPE sflight-fldate.
  DATA: lv_title TYPE string VALUE 'Wählen Sie einen Wert'.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'lv_fdate'
      dynpprog        = sy-repid
      dynpnr          = sy-dynnr
      dynprofield     = 'p_fldate'
      value_org       = 'S'
*     window_title    = lv_title
    TABLES
      value_tab       = lt_fldate
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.

  IF sy-subrc = 0.
    READ TABLE lt_fldate INTO lv_values WITH KEY lv_fdate = p_val.
    IF sy-subrc = 0.
      p_val = lv_values-lv_fdate.
    ENDIF.
  ENDIF.
ENDFORM.
