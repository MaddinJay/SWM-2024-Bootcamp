*&---------------------------------------------------------------------*
*& Report zod_leap
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_leap.
DATA lv_result TYPE abap_bool.
PARAMETERS p_ano TYPE i.

DATA lo_leap TYPE REF TO zod_leap.
lo_leap = NEW #(  ).
lo_leap->leap(
  EXPORTING
    year   = p_ano
  RECEIVING
    result = lv_result
).

if lv_result = 'X'.
 write: |Das jahr { p_ano } ist ein Schaltjahr|.
 ELSE.
  write: |Das jahr { p_ano } ist kein Schaltjahr|.
  endif.
