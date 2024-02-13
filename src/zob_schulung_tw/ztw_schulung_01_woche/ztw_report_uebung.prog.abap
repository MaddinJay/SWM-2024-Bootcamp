*&---------------------------------------------------------------------*
*& Report ztw_report_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_report_uebung.

TABLES: mara.
*WRITE 'Hallo Welt.'.

PARAMETERS p_value1 TYPE p DECIMALS 2 OBLIGATORY.
PARAMETERS p_prodct TYPE c LENGTH 24 OBLIGATORY. " Eingabe Pflicht!!


SELECTION-SCREEN BEGIN OF BLOCK TEXT-001 WITH FRAME TITLE Bla.
PARAMETERS p_t19 RADIOBUTTON GROUP tax.
PARAMETERS p_t07 RADIOBUTTON GROUP tax DEFAULT 'X'.
PARAMETERS p_show AS CHECKBOX DEFAULT 'X'.
SELECTION-SCREEN END OF BLOCK TEXT-001.

SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS.  " no intervals  es sind keine Intervalle erlaubt.

IF p_value1 IS INITIAL.
  DATA(lv_message) = |Geben sie einen anderen Betrag als { p_value1 } an.|.
  MESSAGE lv_message TYPE 'S' DISPLAY LIKE 'S'. " Typ:  A (Abbruch),  S (Statuszeile), I (Information), E (Error) oder W (Warnung)
ENDIF.

*******************************
*Datendeklination
*******************************
DATA lv_brutto TYPE p DECIMALS 2.
DATA lv_tax TYPE p DECIMALS 2 VALUE '0.00'.

*******************************
*Radiobuttons IF
*******************************
IF p_t19 = abap_true.
  lv_tax = '1.19'.
ELSEIF p_t07 = abap_true.
  lv_tax = '1.07'.
ENDIF.
*******************************
*Berechnungen
*******************************
lv_brutto = p_value1 * lv_tax.

*******************************
*Checkbox und  Ausgabe
*******************************
WRITE: / 'Betrag:', p_value1.
WRITE: / 'Bruttobetrag:', lv_brutto.

IF p_show = abap_true.
  LOOP AT s_pnum INTO DATA(ls_pnum).
    WRITE: / 'Produktnummer:', ls_pnum-low.
  ENDLOOP.
ENDIF.
