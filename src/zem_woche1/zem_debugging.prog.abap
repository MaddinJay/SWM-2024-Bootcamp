*&---------------------------------------------------------------------*
*& Report zem_debugging
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_debugging.

*
*Data(lv_test2) = |Test|.
*lv_test2 = 'Dies ist ein Test'.
*Write lv_test2.

*DATA lv_test type string.
*
*lv_test = 'Test'.
*
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.

DATA: lv_add_three TYPE i Value 3,
      lv_amount TYPE i,
      lv_bigger_than_thirty TYPE abap_bool.

*WHILE lv_bigger_than_thirty <> abap_true.
*
**lv_amount = lv_amount + lv_add_three.   "gleichbedeutend mit lv_amount + lv_add_three
*  lv_amount += lv_add_three.
*
*  WRITE: 'The amount is ' , lv_amount.
*
*ENDWHILE.

WHILE lv_amount < 30.

*lv_amount = lv_amount + lv_add_three.   "gleichbedeutend mit lv_amount + lv_add_three
  lv_amount += lv_add_three.

  WRITE: 'The amount is ' , lv_amount.

ENDWHILE.
