*&---------------------------------------------------------------------*
*& Report zuh_unterprogramm2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_unterprogramm2.


FORM zuh_wortteiler USING lv_text
 CHANGING textzurueck.

  DATA text2 TYPE string.

  SPLIT lv_text AT space INTO textzurueck text2.

ENDFORM.

START-OF-SELECTION.


PARAMETERS: p_text type string.


Data lv_text type string.
Data textzurueck type string.
lv_text = p_text.

PERFORM zuh_wortteiler USING lv_text CHANGING textzurueck.

write / textzurueck.
