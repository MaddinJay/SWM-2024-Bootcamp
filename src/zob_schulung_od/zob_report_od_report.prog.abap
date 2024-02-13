*&---------------------------------------------------------------------*
*& Report zob_report_od_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_report.

WRITE 'Hello World'.

TABLES: mara.
DATA: lv_brutto TYPE p DECIMALS 2,
      lv_tax TYPE p DECIMALS 2.
SELECTION-SCREEN BEGIN OF BLOCK MAIN WITH FRAME TITLE Text-001.
PARAMETERS p_value1 TYPE p DECIMALS 2.
PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK main.

SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS. "muss bezug zu DDAT haben
PARAMETERS: p_t19 RADIOBUTTON GROUP tax DEFAULT 'X',
 p_t07 RADIOBUTTON GROUP tax.

PARAMETERS p_show AS CHECKBOX.


lv_brutto = p_value1 * '1.19'.
WRITE: / 'Betrag:', p_value1.
WRITE: / 'Bruttobetrag:', lv_brutto.

IF p_value1 IS INITIAL.
  DATA(lv_message) = |Geben sie einen anderen Betrag als { p_value1 } an.|.
  MESSAGE lv_message TYPE 'I'. "Typ Ausgabe der Meldungen

ENDIF.
LOOP AT s_pnum INTO DATA(ls_pnum).
 WRITE: / 'Produktnummer:', ls_pnum-low.

ENDLOOP.


* lv_tax = '0.00'.
*IF p_t19 = 'X'.
* lv_tax = '1.19'.
*ELSEIF p_t07 = 'X'.
* lv_tax = '1.07'.
*ENDIF.
*lv_brutto = p_value1 * lv_tax.
*WRITE lv_brutto.

lv_tax = '0.00'.
IF p_show = 'X'.
 lv_tax = '1.19'.
ELSEIF p_t07 = 'X'.
 lv_tax = '1.07'.
ENDIF.
lv_brutto = p_value1 * lv_tax.
*WRITE lv_brutto.
