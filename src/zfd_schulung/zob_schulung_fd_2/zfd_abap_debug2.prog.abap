*&---------------------------------------------------------------------*
*& Report zfd_abap_debug2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_abap_debug2.

DATA: lv_add_three          TYPE i VALUE 3,
      lv_amount             TYPE i,
      lv_bigger_than_thirty TYPE abap_bool.

WHILE lv_bigger_than_thirty <> abap_true.
  lv_amount += lv_add_three. " ist das gleiche wie lv_amount = lv_amount + lv_add_three.
  WRITE: /, 'The amount is ' , lv_amount.
  IF lv_amount > 30.
    lv_bigger_than_thirty = abap_true.
  ENDIF.
ENDWHILE.
