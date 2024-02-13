*&---------------------------------------------------------------------*
*& Report z_uebung_report_22112023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_report2_22112023.

*Ausgabe
*WRITE 'HELLO WORLD'.
TABLES mara.
*Parameter


PARAMETERS p_value TYPE p DECIMALS 2."Weist einem Feld einen Wert über das Selektionsbild zu. OBLIGATORY heißt, dass es ein Pflichtfeld ist
PARAMETERS p_prodct TYPE c LENGTH 24.
SELECTION-SCREEN BEGIN OF BLOCK Mehrwertsteuer WITH FRAME TITLE TEXT-002.
  PARAMETERS p_mst1 TYPE c  RADIOBUTTON GROUP MwSt.
  PARAMETERS p_mst2 TYPE c RADIOBUTTON GROUP MwSt.
SELECTION-SCREEN END OF BLOCK Mehrwertsteuer.
SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS.
PARAMETERS p_show AS CHECKBOX.
DATA lv_tax TYPE p DECIMALS 2.
DATA lv_erg TYPE p DECIMALS 2.

INITIALIZATION.
  p_value = 100.
  MESSAGE 'Initialization' TYPE 'I'.

AT SELECTION-SCREEN OUTPUT.
  MESSAGE 'Output' TYPE 'I'.
  LOOP AT SCREEN.
    IF screen-name = 'P_VALUE'. "P_VALUE muss groß sein, da ansonsten das Feld nicht ausgegraut wird.
      screen-input = abap_false.
    ENDIF.
    MODIFY SCREEN. "Soll innerhalb der LOOP_Schleife stehen.
  ENDLOOP.


START-OF-SELECTION. " Ist implizit bereits drin, wenn vorhergehend bspw. Initialization genutzt wurde, dann muss es erfolgen

  IF p_mst1 = abap_true. "If für Radiobutton
    lv_tax ='1.19'.
  ELSE.
    p_mst2 = abap_true.
    lv_tax = '1.07'.
  ENDIF.

  IF p_show = abap_true."IF für Checkbox
    LOOP AT s_pnum INTO DATA(ls_pnum).
      WRITE: / 'Produktnummer:', ls_pnum-low. "low weist auf eine Spalte hin
    ENDLOOP.
  ENDIF.

  lv_erg = p_value * lv_tax.

  WRITE lv_erg.
