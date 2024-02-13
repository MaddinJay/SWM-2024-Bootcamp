*&---------------------------------------------------------------------*
*& Report zoblv_aufruf_leap
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zoblv_aufruf_leap.

DATA: lo_leap   TYPE REF TO zcl_leap,
      lv_year   TYPE i VALUE 2024,
      lv_result TYPE abap_bool.

CREATE OBJECT lo_leap.

lv_result = lo_leap->leap( lv_year ).

IF lv_result = abap_true.
WRITE: / 'Das Jahr ', lv_year, 'ist ein Schaltjahr'.
ELSE.
WRITE: / 'Das Jahr ', lv_year, 'ist KEIN SCHALTJAHR'.
ENDIF.
