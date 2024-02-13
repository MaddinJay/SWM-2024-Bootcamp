*&---------------------------------------------------------------------*
*& Report zst_debuggen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_debuggen.

*DATA(lv_test) = |Test|.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.

ULINE.

DATA: lv_add_three          TYPE i VALUE 3,
      lv_amount             TYPE i,
      lv_bigger_than_thrity TYPE abap_bool.

WHILE lv_bigger_than_thrity <> abap_true.
  lv_amount += lv_add_three.
  WRITE: 'The amount is ' , lv_amount.
  IF lv_amount >= 30.
    EXIT.
  ENDIF.
ENDWHILE.

ULINE.

DATA lv_value TYPE string.
lv_value = 'ABC'.
WRITE lv_value.

ULINE.
DATA: lt_table TYPE STANDARD TABLE OF i.

DO 10 TIMES.
  APPEND sy-index TO lt_table.
ENDDO.
LOOP AT lt_table INTO DATA(lv_index).
  WRITE: / lv_index.
ENDLOOP.

Uline.

PARAMETERS: p_date TYPE sy-datum.
WRITE: / 'Das gewählte Datum ist', p_date.

Uline.
