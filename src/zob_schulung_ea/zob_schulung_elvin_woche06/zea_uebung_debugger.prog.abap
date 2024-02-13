*&---------------------------------------------------------------------*
*& Report zea_uebung_debugger
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zea_uebung_debugger.

DATA(lv_test) = |Test|. "PIPES Symbol erzeugt einen String.
lv_test = 'Dies ist ein Test'.
WRITE lv_test.

DATA: lv_add_three TYPE i VALUE 3,
 lv_amount TYPE i,
 lv_bigger_than_thrity TYPE abap_bool.
WHILE lv_bigger_than_thrity <> abap_true.
 lv_amount += lv_add_three.
 lv_bigger_than_thrity = abap_true.
 WRITE: 'The amount is ' , lv_amount.
ENDWHILE.


DATA lv_value TYPE string.
lv_value = 'ABC'.
WRITE lv_value.


DATA: lt_table TYPE STANDARD TABLE OF i,
 lv_index TYPE i.
DO 10 TIMES.
 APPEND sy-index TO lt_table.
ENDDO.
LOOP AT lt_table INTO lv_index.
 WRITE: / lv_index.
ENDLOOP.


IF sy-subrc = 0.
   WRITE 'UZ UZ UZ'.
ElSE.
   WRITE: 'Znaci , KURCINA'.
ENDIF.
