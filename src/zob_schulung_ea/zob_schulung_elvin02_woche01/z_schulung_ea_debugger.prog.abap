*&---------------------------------------------------------------------*
*& Report z_schulung_ea_debugger
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_schulung_ea_debugger.

*DATA(lv_test) = 'Test'.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.


DATA: lv_add_three TYPE i VALUE 3,
 lv_amount TYPE i,
 lv_bigger_than_thrity TYPE abap_bool.


WHILE lv_bigger_than_thrity <> abap_true.
 lv_amount += lv_add_three.
 WRITE: 'The amount is ' , lv_amount.
ENDWHILE.
