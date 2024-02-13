*&---------------------------------------------------------------------*
*& Report zfd_leapi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_leapi.

PARAMETERS p_year TYPE i.

DATA lv_result TYPE abap_bool.
DATA lo_leapi TYPE REF TO zfd_leap_years.

lo_leapi = NEW #(  ).
lo_leapi->leap( EXPORTING year = p_year
                RECEIVING result = lv_result ).

IF lv_result = 'X'.
  WRITE: |Das Jahr { p_year } ist ein Schaltjahr.|.
ELSE.
  WRITE: |Das Jahr { p_year } ist kein Schaltjahr.|.

ENDIF.
