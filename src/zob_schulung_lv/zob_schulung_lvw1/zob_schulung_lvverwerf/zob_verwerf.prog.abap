*&---------------------------------------------------------------------*
*& Report zob_verwerf
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*


REPORT zuh_debugging2.

DATA: lv_add_three          TYPE i VALUE 3,
      lv_amount             TYPE i,
      lv_bigger_than_thirty TYPE abap_bool.

WHILE lv_bigger_than_thirty <> abap_true.
  lv_amount += lv_add_three.
  WRITE: 'The amount is ' , lv_amount.
  if lv_amount >= 30.
  lv_bigger_than_thirty = abap_true.
  endif.
ENDWHILE.
