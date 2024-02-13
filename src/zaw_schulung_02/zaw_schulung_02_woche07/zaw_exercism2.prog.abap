*&---------------------------------------------------------------------*
*& Report zaw_exercism2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_exercism2.


*DATA: lo_string TYPE REF TO zaw_gcl_reverse,
*      lv_string TYPE string.
*
*lo_string = NEW #(  ).
*lv_string = 'robot'.
*
*lv_string = lo_string->reverse_string( lv_string ).
*
*WRITE: lv_string.


DATA: lo_tel    TYPE REF TO zaw_gcl_telephone,
      lv_number TYPE string.

lo_tel = NEW #(  ).
*lv_number = '223 456   7890   '.

lv_number = lo_tel->clean( number ='223 456   7890   ' ).

WRITE: lv_number.
