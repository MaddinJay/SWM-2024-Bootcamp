*&---------------------------------------------------------------------*
*& Report zbl_debuguebung0801
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_debuguebung0801.
*
*data(lv_test) = 'test'.
*lv_test = 'dies ist ein test'.
*write lv_test.

DATA: lv_add_three TYPE i VALUE 3,
 lv_amount TYPE i,
 lv_bigger_than_thrity TYPE abap_bool.
WHILE lv_bigger_than_thrity > abap_true.
 lv_amount += lv_add_three.
 WRITE: 'The amount is ' , lv_amount.
ENDWHILE.
