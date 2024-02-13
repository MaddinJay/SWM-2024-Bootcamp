*&---------------------------------------------------------------------*
*& Report z_ob_re_selection_screen_mb
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_selection_screen_007.
TABLES: mara.     "wichtig, damit der Sselect-befehl funktioniert muss eine verknüpfung zu einen Tabelle her´gestellt werden.

Selection-Screen BEGIN OF BLOCK Main WITH FRAME TITLE Text-001.
PARAMETERS p_value1 TYPE p DECIMALS 2.
PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY. "OBLIGATORY Pflichtfeld daher Fehlermeldung
SELECTION-Screen END OF BLOCK main.

*Parameters: p_test Type c as CHECKBOX.  eine Box zum anclicken
Selection-Screen BEGIN OF BLOCK prozent WITH FRAME TITLE Text-002.
PARAMETERS: p_t19  RADIOBUTTON GROUP tax DEFAULT 'X',
            p_t07 RADIOBUTTON GROUP tax.
SELECTION-Screen END OF BLOCK prozent.

Selection-Screen BEGIN OF BLOCK Produkte WITH FRAME TITLE Text-003.
SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS.   " Es sind keinen Intervalle erlaubt.
*Types lv_tax TYPE p DECIMALS 2.
SELECTION-Screen END OF BLOCK Produkte.


DATA(lv_tax) = '0.00'.
IF p_t19 = abap_true.
lv_tax = '1.19'.
ELSEIF p_t07 = abap_true.
lv_tax = '1.07'.
ENDIF.
DATA lv_brutto TYPE p DECIMALS 2.
lv_brutto = p_value1 * lv_tax.

IF p_value1 IS INITIAL.     "ist das Feld befüllt?
  DATA(lv_message) = |Geben sie einen anderen Betrag als { p_value1 } an.|.
  MESSAGE lv_message TYPE 'I'.  "Ausgabe der Meldung mit dem Typen Information
ENDIF.



WRITE: / 'Betrag:', p_value1.
WRITE: / 'Bruttobetrag:', lv_brutto.
WRITE: / 'Produkt:', p_prod.

PARAMETERS p_show AS CHECKBOX.
If p_show = abap_true.
LOOP AT s_pnum INTO DATA(ls_pnum).
WRITE: /, 'Produktnummer:', ls_pnum-low.
ENDLOOP.
Endif.
