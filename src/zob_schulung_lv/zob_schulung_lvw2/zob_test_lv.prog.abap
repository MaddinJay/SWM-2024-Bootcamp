*&---------------------------------------------------------------------*
*& Report zob_report_od_minip
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_minip.

TABLES scounter. "Tabelle verbinden

SELECTION-SCREEN BEGIN OF SCREEN 100 TITLE TEXT-odt AS WINDOW.
  PARAMETERS: p_suche  TYPE scounter-carrid  OBLIGATORY,
              p_suche2 TYPE scounter-airport OBLIGATORY.
SELECTION-SCREEN END OF SCREEN 100.

SELECTION-SCREEN BEGIN OF SCREEN 101 TITLE TEXT-tmd AS WINDOW.
  PARAMETERS: p_carrup TYPE scounter-carrid  OBLIGATORY,
              p_scoup  TYPE scounter-countnum OBLIGATORY,
              p_airup  TYPE scounter-airport OBLIGATORY.
SELECTION-SCREEN END OF SCREEN 101.

SELECTION-SCREEN BEGIN OF SCREEN 200 TITLE TEXT-dtm AS WINDOW.
  PARAMETERS: p_no RADIOBUTTON GROUP r_g1,
              p_ja RADIOBUTTON GROUP r_g1.
SELECTION-SCREEN END OF SCREEN 200.

SELECTION-SCREEN BEGIN OF SCREEN 300 TITLE TEXT-omd AS WINDOW.
  PARAMETERS: p_flugg  TYPE string OBLIGATORY,
              p_flugct TYPE string OBLIGATORY,
              p_flugha TYPE string OBLIGATORY.
SELECTION-SCREEN END OF SCREEN 300.

TYPES: BEGIN OF ls_tabelle,
         carrid   LIKE scounter-carrid,
         countnum LIKE scounter-countnum,
         airport  LIKE scounter-airport,
       END OF ls_tabelle.

DATA ls_tabelle TYPE ls_tabelle.
TYPES: lty_t_utab TYPE STANDARD TABLE OF ls_tabelle.
DATA lt_utab TYPE lty_t_utab.

START-OF-SELECTION.
  CALL SELECTION-SCREEN 100 USING SELECTION-SET 100.

  SELECT
    FROM
      scounter
    FIELDS
      carrid AS Fluggeselschaft,
      countnum AS Schalternummer,
      airport AS Flughafen
        WHERE carrid = @p_suche AND airport = @p_suche2
    INTO @ls_tabelle.
  ENDSELECT.

  IF sy-subrc = 0. "wenn selection ok

    p_carrup = ls_tabelle-carrid.
    p_scoup = ls_tabelle-countnum.
    p_airup = ls_tabelle-airport.
    MESSAGE: | Suchergebnis:  Airline { p_suche } | &  | Schalter { ls_tabelle-countnum } | & | Airport { p_suche2 } | TYPE 'I'.

    DATA : ant TYPE char1.

    CALL FUNCTION 'POPUP_WITH_2_BUTTONS_TO_CHOOSE'
      EXPORTING
        diagnosetext1 = 'Bitte selektieren Sie eine Option'
        textline1     = 'Möchten Sie die bereits vorhandene Daten editieren?'
        text_option1  = 'Ya'
        text_option2  = 'Nein'
        titel         = 'Bitte selektieren Sie eine Option'
      IMPORTING
        answer        = ant.

    CASE ant.

      WHEN '1'.
        CALL SELECTION-SCREEN 101.

        DATA: lv_carid TYPE scounter-carrid,
              lv_airp  LIKE scounter-airport,
              lv_count LIKE scounter-countnum.

        lv_carid = p_carrup.
        lv_airp = p_airup.
        lv_count = p_scoup.
*        WRITE: p_carrup, /, p_airup, /, lv_count.

        MODIFY scounter FROM @( VALUE #( carrid = lv_carid countnum = lv_count airport = p_airup ) ).

        IF sy-subrc = 0. "wenn Treffer ok

          MESSAGE: |Ihre Eingabe wurde übernommen| & | Airline:  { lv_carid } | &
          | Schalternummer:  { lv_count } | &
          | Airport:  { p_airup } | TYPE 'S'.


        ELSE.
          MESSAGE 'keine Ändeung übernomnnen' TYPE 'I'.
          EXIT.
        ENDIF.

      WHEN '2'.
*        MESSAGE 'keine Ändeung übernomnnen' TYPE 'I'.
*        EXIT.
    ENDCASE.

  ELSE.
    MESSAGE |Ihre Suche Ergab keinen Treffer| TYPE 'I'.
    CALL SELECTION-SCREEN 200.

    IF p_no = 'X'.
      WRITE 'Danke für Ihren Besuch'.
      EXIT.
    ELSE.
      CALL SELECTION-SCREEN 300.
      DATA(ls_scounter_insert) = VALUE scounter(
      carrid = p_flugg
      countnum = p_flugct
      airport = p_flugha
      ).
      INSERT INTO scounter VALUES ls_scounter_insert.
      IF sy-subrc = 0.
        MESSAGE: |Ihre Eingabe wurde übernommen| & | Airline:  { p_flugg } | &
          | Schalternummer:  { p_flugct } | &
          | Airport:  { p_flugha } | TYPE 'S'.

      DATA : res TYPE char1.
      CALL FUNCTION 'POPUP_WITH_2_BUTTONS_TO_CHOOSE'
      EXPORTING
        diagnosetext1 = 'Bitte selektieren Sie eine Option'
        textline1     = 'Möchten Sie noch einen Eintrag hinzufügen?'
        text_option1  = 'Ya'
        text_option2  = 'Nein'
        titel         = 'Bitte selektieren Sie eine Option'
      IMPORTING
        answer        = res.

    do 2 Times.
    if res = 1.

      CALL SELECTION-SCREEN 300.

      DATA(ls_scounter1_insert) = VALUE scounter(
      carrid = p_flugg
      countnum = p_flugct
      airport = p_flugha
      ).
      INSERT INTO scounter VALUES ls_scounter1_insert.
      IF sy-subrc = 0.
        MESSAGE: |Ihre neue Eingabe wurde übernommen| & | Airline:  { p_flugg } | &
          | Schalternummer:  { p_flugct } | &
          | Airport:  { p_flugha } | TYPE 'S'.
      else.
      ENDIF.
      ELSEIF res = 2.
      EXIT.
      ENDIF.
   ENDDO.

      ELSE.
        WRITE 'WAS PASSIERT HIER?'.
      ENDIF.
    ENDIF.
  ENDIF.
