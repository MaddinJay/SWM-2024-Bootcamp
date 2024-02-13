*&---------------------------------------------------------------------*
*& Report zuh_debugging4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_debugging4.

DATA: lt_table TYPE STANDARD TABLE OF i,
 lv_index TYPE i.
DO 10 TIMES.
 APPEND sy-index to lt_table.
ENDDO.
LOOP AT lt_table INTO lv_index.
 WRITE: / lv_index.
ENDLOOP.
