*&---------------------------------------------------------------------*
*& Report z_schulung_programm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_schulung_programm.
TABLES mara.

"Ausgabe"
*WRITE 'HELLO WORLD'.

PARAMETERS p_value1 TYPE p DECIMALS 2.
PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY.
PARAMETERS: p_t19 RADIOBUTTON GROUP tax DEFAULT 'X',
            p_t07 RADIOBUTTON GROUP tax.
PARAMETERS p_show AS CHECKBOX.

SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS.

IF p_value1 IS INITIAL.
    DATA(lv_message) = |geben Sie einen anderen Betreg ein als { p_value1 } an|.
        "Ausgabe einer Meldung - Information"
    MESSAGE lv_message TYPE 'I'.
ENDIF.


DATA lv_tax TYPE p DECIMALS 2 VALUE '0.00'.
  IF p_t19 = 'X'.
     lv_tax = '1.19'.
  ELSEIF p_t07 = 'X'.
     lv_tax = '1.07'.
  ENDIF.


DATA lv_brutto TYPE p DECIMALS 2.
*lv_brutto = p_value1 * '1.19'.
lv_brutto = p_value1 * lv_tax.

WRITE: 'BETRAG', p_value1.
WRITE: / 'BRUTTOBETRAG', lv_Brutto.
WRITE: / 'PRODUKT' , p_prod.





"AUSGABE DER EINGEGEBENEN SELECT OPTIONS"
*LOOP AT s_pnum INTO DATA(ls_pnum).
*WRITE: / 'Produktnummer:', ls_pnum-low.
*ENDLOOP.

IF p_show = abap_true.
   LOOP AT s_pnum INTO DATA(ls_pnum).
   WRITE: / 'PRODUKTNUMMER:', ls_pnum-low.
  ENDLOOP.
ENDIF.
