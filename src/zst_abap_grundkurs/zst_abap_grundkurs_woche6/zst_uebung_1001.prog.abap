*&---------------------------------------------------------------------*
*& Report zst_uebung_1001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_uebung_1001.

FORM ausgabe_zahl
 USING nummer1 TYPE int1
       nummer2 TYPE int1
 CHANGING ergebnis TYPE int1.

  IF nummer1 > nummer2.
    ergebnis = nummer1.
  ELSE.
    ergebnis = nummer2.
  ENDIF.

ENDFORM.

START-OF-SELECTION.
  DATA lv_result TYPE int1.
  PARAMETERS: p_num1 TYPE int1,
              p_num2 TYPE int1.

  PERFORM ausgabe_zahl USING p_num1 p_num2 CHANGING lv_result.
  WRITE lv_result.

  ULINE.

FORM erster_satz
USING text TYPE string
CHANGING ergebnis TYPE string
rest TYPE string.

  SPLIT text AT ' ' INTO ergebnis rest.

ENDFORM.

START-OF-SELECTION.
  DATA lv_result2 TYPE string.
  DATA lv_result3 TYPE string.
  PARAMETERS: p_text TYPE string.


  PERFORM erster_satz USING p_text CHANGING lv_result2 lv_result3.
  WRITE lv_result2.
