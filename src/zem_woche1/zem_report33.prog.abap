*&---------------------------------------------------------------------*
*& Report zem_report33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_report33.

Tables: mara.

SELECTION-SCREEN BEGIN OF BLOCK MOIN with FRAME TITLE text-001. "erzeugt einen Rahmen um die Eingaben und benennt Ihn.

  Select-options s_pnum for mara-matnr NO INTERVALS.      "eingabefelder mit Intervall
  Parameters p_p AS CHECKBOX.                "macht einen
*SELECT-OPTIONS s_pnum for lv_select2 NO Intervals.

SELECTION-SCREEN End of Block MOIN.

Parameters p_input type c LENGTH 9 OBLIGATORY.  "Pflichtfelt = OBLIGATORY
*Data: lv_select2 type matnr.

SELECTION-SCREEN BEGIN OF BLOCK MAIN with FRAME TITLE text-002.

  PARAMETERS  p_netto type p DECIMALS 2.
  PARAMETERS: p_t19 RADIOBUTTON GROUP tax Default 'X',  "eingabefelder mit nur einer möglichen Auswahl
              p_t07 RADIOBUTTON GROUP tax.

SELECTION-SCREEN end of block main.


Data lv_tax type p DECIMALS 2.

IF p_t19 = abap_true.
  lv_tax = '1.19'.
  elseif p_t07 = abap_true.
  lv_tax = '1.07'.
Endif.

Data lv_brutto type p DECIMALS 2.

lv_brutto = p_netto * lv_tax.

uline.

Write: /, 'Brutto nach ausgewähltem Steuersatz:', lv_brutto.

write:  /, 'Netto:', p_netto.

Write: /, p_p, /.

Skip.
uline.
Skip 2.

IF p_input = ' '.                                "wenn keine Eingabe in p_input erfolgt, wird es angezeigt
 Write / 'keine Eingabe im Feld Freestyle'.
 Else. Write: /,'Hier bitte, Deine Eingabe', p_input.

Endif.

*IF p_input is INITIAL.                               "Hinweistext wenn Eingabefeld (p_input) nicht gefüllt ist
*Data(lv_message) = |Geben Sie einen anderen Betrag als { p_input } an.|.
*MESSAGE lv_message type 'I'.
*Endif.
*
*if p_p = abap_true.                              "Anweisung wenn Auswahlfeld (flag)aktiviert wurde  wurde
*  LOOP AT s_pnum INTO DATA(ls_pnum).
* WRITE: /, 'Produktnummer:', ls_pnum-low.
*ENDLOOP.
*
*Endif.

*LOOP AT s_pnum INTO DATA(ls_pnum).
* WRITE: /, 'Produktnummer:', ls_pnum-low.
*ENDLOOP.
