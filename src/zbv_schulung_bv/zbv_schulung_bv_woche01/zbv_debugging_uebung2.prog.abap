*&---------------------------------------------------------------------*
*& Report zbv_debugging_uebung2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_debugging_uebung2.

DATA: lv_add_three TYPE i VALUE 3,
 lv_amount TYPE i,
 lv_bigger_than_thirty TYPE abap_bool.

*WHILE lv_bigger_than_thirty <> abap_true.
* lv_amount += lv_add_three.
* "gleichebdeuteund zu:
*lv_ammount = lv_amount + lv_add-three.
* WRITE: 'The amount is ' , lv_amount.
* IF lv_amount >= 30.
* lv_bigger_than_thirty = abap_true.
* ENDIF.
*ENDWHILE.

WHILE lv_amount < 30.
lv_amount += lv_add_three.
"gleichbedeuteund zu:
*lv_amount = lv_amount + lv_add_three.
WRITE: 'The amount is ', lv_amount.
ENDWHILE.
