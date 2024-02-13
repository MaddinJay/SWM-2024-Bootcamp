*&---------------------------------------------------------------------*
*& Report zob_schulung_selektionsbilder
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_schulung_selektionsbilder.
*Erstellen Sie ein Selektionsbild,
*der den Inputparameter Betrag erwartet und dazu einen neuen Betrag berechnet,
*der die Mehrwertsteuer von 19% enthält.

tables mara.

PARAMETERS p_netto type p decimals 2.
PARAMETERS p_prod TYPE c LENGTH 21 OBLIGATORY.


Data: lv_brutto type p decimals 2.

lv_brutto = p_netto * '1.19'.

write: / 'Betrag:',p_netto.
write: / 'Bruttobetrag:', lv_brutto.



SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS.

LOOP AT s_pnum INTO DATA(ls_pnum).
 WRITE: / 'Produktnummer:', ls_pnum-low.
ENDLOOP.
