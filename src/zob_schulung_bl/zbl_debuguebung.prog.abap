*&---------------------------------------------------------------------*
*& Report zbl_debuguebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_debuguebung.

"DATA lv_test TYPE string.
"lv_test = 'Test'.
"lv_test = 'Dies ist ein Test'.
"WRITE lv_test.

DATA: lv_add_three TYPE i VALUE 3,
 lv_amount TYPE i,
 lv_bigger_than_thirty TYPE abap_bool.

WHILE lv_bigger_than_thirty <> abap_true.
 lv_amount += lv_add_three.
 IF lv_amount > 30.
 lv_bigger_than_thirty = abap_true.
 ENDIF.
 WRITE: 'The amount is ' , lv_amount.
ENDWHILE.
