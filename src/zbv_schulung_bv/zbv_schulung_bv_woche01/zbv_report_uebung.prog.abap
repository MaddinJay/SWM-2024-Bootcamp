*&---------------------------------------------------------------------*
*& Report zbv_report_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_report_uebung.
TABLES: mara. "<---- WICHTIG, damit SELECT-OPTION ... FOR ... funtioniert
*WRITE 'Hello World!'.

SELECTION-SCREEN BEGIN OF BLOCK MAIN WITH FRAME TITLE text-HDR.
  PARAMETERS p_value1 TYPE p DECIMALS 2.
  PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY. "<--- OBLIGATORY: Eingabe ist pflicht
SELECTION-SCREEN END OF BLOCK MAIN.

SELECTION-SCREEN BEGIN OF BLOCK SECOND WITH FRAME TITLE text-STR.
  PARAMETERS: p_t19 RADIOBUTTON GROUP tax DEFAULT 'X',
            p_t07 RADIOBUTTON GROUP tax.
SELECTION-SCREEN END OF BLOCK SECOND.

SELECTION-SCREEN BEGIN OF BLOCK THIRD WITH FRAME TITLE text-PRD.
  SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS. "<--- NO INTERVALS: Es sind keine Ranges erlaubt
  PARAMETERS p_show AS CHECKBOX.
SELECTION-SCREEN END OF BLOCK THIRD.

IF p_value1 is INITIAL.
  DATA(lv_message) = |Geben sie einen anderen Betrag als { p_value1 } an.|.
  "Ausgabe einer Meldung - Information
  MESSAGE lv_message TYPE 'I'.
ENDIF.


DATA lv_brutto TYPE p DECIMALS 2.

*lv_brutto = p_value1 * '1.19'. "<----- Warum wird eine Zahl mit Nachkommestellen in Anführungszeichen geschrieben? Das ist doch dann ein Char?
*WRITE lv_brutto.
WRITE : / 'Produkt:' , p_prod.

"Ausgabe der Eingebene Select Options
*LOOP AT s_pnum INTO DATA(ls_pnum).
*  WRITE: / 'Produktnummer:', ls_pnum-low.
*ENDLOOP.

DATA(lv_tax) = '0.00'.
IF p_t19 = abap_true.
 lv_tax = '1.19'.
ELSEIF p_t07 = abap_true.
 lv_tax = '1.07'.
ENDIF.
lv_brutto = p_value1 * lv_tax.

WRITE: / 'Nettobetrag: ', p_value1.
WRITE: / 'Bruttobetrag: ', lv_brutto.
IF p_show = abap_true.
  LOOP AT s_pnum INTO DATA(ls_pnum).
  WRITE: / 'Produktnummer: ', ls_pnum-low.
  ENDLOOP.
ENDIF.
