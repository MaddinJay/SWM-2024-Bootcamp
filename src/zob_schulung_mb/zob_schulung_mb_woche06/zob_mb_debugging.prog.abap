*&---------------------------------------------------------------------*
*& Report zob_mb_debugging
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_debugging.


*DAT(lv_test) = 'Test'.


*DATA lv_test type string value 'Test'.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.


DATA: lv_add_three TYPE i VALUE 3,
 lv_amount TYPE i,
 lv_bigger_than_thirty TYPE abap_bool.



 while lv_amount < 30.
 lv_amount += lv_add_three.
 WRITE: 'The amount is ' , lv_amount.
ENDWHILE.
