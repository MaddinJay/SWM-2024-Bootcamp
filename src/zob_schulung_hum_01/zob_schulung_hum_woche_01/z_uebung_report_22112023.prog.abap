*&---------------------------------------------------------------------*
*& Report z_uebung_report_22112023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_report_22112023.

*Ausgabe
*WRITE 'HELLO WORLD'.
TABLES mara.
*Parameter


PARAMETERS p_value Type p DECIMALS 2 OBLIGATORY."Weist einem Feld einen Wert über das Selektionsbild zu. OBLIGATORY heißt, dass es ein Pflichtfeld ist
PARAMETERS p_prodct Type c LENGTH 24.
SELECTION-SCREEN BEGIN OF BLOCK Mehrwertsteuer WITH FRAME TITLE TEXT-HDR.
PARAMETERS p_mst1 TYPE c  Radiobutton group MwSt.
PARAMETERS p_mst2 TYPE c Radiobutton group MwSt.
SELECTION-SCREEN END OF BLOCK Mehrwertsteuer.
SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS.
PARAMETERS p_show AS CHECKBOX.
DATA lv_tax type p Decimals 2.
DATA lv_erg type p DECIMALS 2.

IF p_mst1 = abap_true. "If für Radiobutton
lv_tax ='1.19'.
ELSE. p_mst2 = abap_true.
lv_tax = '1.07'.
ENDIF.

IF p_show = abap_true."IF für Checkbox
LOOP AT s_pnum INTO DATA(ls_pnum).
WRITE: / 'Produktnummer:', ls_pnum-low. "low weist auf eine Spalte hin
ENDLOOP.
ENDIF.

lv_erg = p_value * lv_tax.

WRITE lv_erg.

 "Wichtig, sonst funktioniert die SELECT_OPTION nicht, weil er die Tabelle nicht kennt, kein Bezug
 " NO INTERVALS es sind keine Intervalle erlaubt
*
*LOOP AT s_pnum INTO DATA(ls_pnum).
* WRITE: / 'Produktnummer:', ls_pnum-low. "low weist auf eine Spalte hin
*ENDLOOP.

*DATA lv_mwst TYPE p DECIMALS 2 VALUE '1.19'.
*DATA lv_erg TYPE p DECIMALS 2.
*DATA lv_product Type c LENGTH 24.




*IF p_prodct is initial.
*DATA(lv_message) = 'Geben Sie einen Produktnamen ein!'.
** Ausgabe einer Nachricht - Information
*MESSAGE lv_message Type 'I'.
*ENDIF.
*WRITE: 'Nettobetrag', p_value, /, 'Mehrwertsteuer', lv_mwst, /, 'Bruttobetrag:', lv_erg.
*WRITE: / 'Produkt:', lv_product.
*
**SELECT_Options " Ermöglicht die Eingabe mehrerer Werte oder Intervalle für ein Feld über das Selektionsbild
*
*SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS. " NO INTERVALS es sind keine Intervalle erlaubt
*
*LOOP AT s_pnum INTO DATA(ls_pnum).
* WRITE: / 'Produktnummer:', ls_pnum-low. "low weist auf eine Spalte hin
*ENDLOOP.
