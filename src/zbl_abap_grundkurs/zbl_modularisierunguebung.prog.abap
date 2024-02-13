*&---------------------------------------------------------------------*
*& Report zbl_modularisierunguebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_modularisierunguebung.

FORM zobbl_bigger USING number_1 TYPE int1
 number_2 TYPE int1
 CHANGING result TYPE int1.
  IF number_1 > number_2.
    result = number_1.
  ELSE.
    result = number_2.
  ENDIF.
ENDFORM.

START-OF-SELECTION.
  DATA: lv_result TYPE int1.
  PERFORM zobbl_bigger USING 20 5 CHANGING lv_result.
  WRITE lv_result.
