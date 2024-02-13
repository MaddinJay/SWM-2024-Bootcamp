*&---------------------------------------------------------------------*
*& Report z_tl_flug_mini_projekt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_tl_flug_mini_projekt.
TABLES spfli.
TABLES saplane.
TABLES sflight.

START-OF-SELECTION.
  SELECTION-SCREEN BEGIN OF SCREEN 100 TITLE TEXT-001 AS WINDOW.
    PARAMETERS: p_flug  TYPE spfli-connid OBLIGATORY, "Connid
                p_flug2 TYPE spfli-carrid OBLIGATORY, "carrid
                p_flug3 TYPE sflight-fldate OBLIGATORY. "fldate
  SELECTION-SCREEN END OF SCREEN 100.

START-OF-SELECTION.
  CALL SELECTION-SCREEN 100 USING SELECTION-SET 100.

*DATA ls_spfli type spfli.

  SELECT SINGLE
    FROM saplane
    JOIN sflight ON saplane~planetype = sflight~planetype
    JOIN spfli ON sflight~carrid = spfli~carrid AND sflight~connid = spfli~connid
    FIELDS
    spfli~connid,
    spfli~carrid,
    saplane~consum AS verbrauch_km,
    saplane~planetype,
    spfli~distance AS flugdistanz,
    spfli~fltime AS flugzeit
    WHERE spfli~connid = @p_flug AND spfli~carrid = @p_flug2 AND sflight~fldate = @p_flug3
    INTO   @DATA(gs_spfli).

  DATA lv_verbrauch TYPE p.

  IF sy-subrc = 0.
    lv_verbrauch = gs_spfli-flugzeit * gs_spfli-verbrauch_km. "+ gs_spfli-lv_passagier ).
    WRITE: 'Verbrauch dieses Fluges: ', lv_verbrauch.
  ENDIF.
