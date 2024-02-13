*&---------------------------------------------------------------------*
*& Report zst_uebung_2311
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_uebung_2311.

DATA(lv_test) = |Test|.
lv_test = 'Dies ist ein Test'.
WRITE lv_test.
Uline.

DATA: lv_add_three TYPE i VALUE 3,
 lv_amount TYPE i,
 lv_bigger_than_thrity TYPE abap_bool.

WHILE lv_bigger_than_thrity <> abap_true.
 lv_amount += lv_add_three. "+= bedeutet lv_amount + lv_add_three
 WRITE: 'The amount is ' , lv_amount.
 if lv_amount >= 30.
 lv_bigger_than_thrity = abap_true.
 endif.
ENDWHILE.
