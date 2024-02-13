*&---------------------------------------------------------------------*
*& Report z_ob_re_mn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_06events_fb.
TABLES: mara.      "<------------- WICHTIG, damit SELECT-OPTION ... FOR .... funktioniert
*"Ausagbe
*WRITE 'Hallo Welt'.

SELECTION-SCREEN BEGIN OF BLOCK main WITH FRAME TITLE TEXT-hdr.
  PARAMETERS p_value1 TYPE p DECIMALS 2.
  PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY. "<--- Eingabe ist pflicht
SELECTION-SCREEN END OF BLOCK main.

SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS. "<--- NO INTERVALS Es sind keine Intervalle erlaubt

INITIALIZATION.
  p_value1 = '100.00'.
  MESSAGE 'Initialization' TYPE 'I'.

AT SELECTION-SCREEN OUTPUT.
MESSAGE 'Output' TYPE 'I'.
  LOOP AT SCREEN.
    IF screen-name = 'P_VALUE1'.
      screen-input = abap_false.
    ENDIF.
    MODIFY SCREEN.
  ENDLOOP.
AT SELECTION-SCREEN On VALUE-REQUEST FOR s_pnum-low.
MESSAGE 'Value Request' TYPE 'I'.

START-OF-SELECTION.
  DATA(lv_tax) = '1.19'.
MESSAGE 'StART' TYPE 'I'.
  DATA(lv_brutto) = p_value1 * lv_tax.
  WRITE lv_brutto.
  WRITE : / 'Produkt:' , p_prod.

  "Ausgabe der Eingebene Select Options
  LOOP AT s_pnum INTO DATA(ls_pnum).
    WRITE: / 'Produktnummer:', ls_pnum-low.
  ENDLOOP.
