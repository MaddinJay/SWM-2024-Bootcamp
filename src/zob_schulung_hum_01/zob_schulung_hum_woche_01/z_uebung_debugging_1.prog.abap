*&---------------------------------------------------------------------*
*& Report z_uebung_debugging_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_debugging_1.

DATA(lv_test) = |test|.
lv_test = 'Dies ist ein Test'.
WRITE lv_test.

ULINE.

DATA: lv_add_three TYPE i VALUE 3,
 lv_amount TYPE i,
 lv_bigger_than_thrity TYPE abap_bool.

WHILE lv_bigger_than_thrity <> abap_true.
 lv_amount = lv_amount + lv_add_three.
 WRITE: 'The amount is ' , lv_amount.
IF lv_amount >= 30.
lv_bigger_than_thrity = abap_true.
ENDIF.
ENDWHILE.
