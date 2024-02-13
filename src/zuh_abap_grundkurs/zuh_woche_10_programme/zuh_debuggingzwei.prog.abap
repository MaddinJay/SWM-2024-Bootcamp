*&---------------------------------------------------------------------*
*& Report zuh_debuggingzwei
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_debuggingzwei.

DATA: lv_add_three          TYPE i VALUE 3,
      lv_amount             TYPE i,
      lv_bigger_than_thrity TYPE abap_bool.

WHILE lv_Amount < 30.
  lv_amount += lv_add_three.
  WRITE: 'The amount is ' , lv_amount.
ENDWHILE.
