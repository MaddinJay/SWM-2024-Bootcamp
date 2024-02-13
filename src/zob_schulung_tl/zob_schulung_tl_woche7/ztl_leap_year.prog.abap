*&---------------------------------------------------------------------*
*& Report ztl_leap_year
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_leap_year.
SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE TEXT-001.

  PARAMETERS p_jahr TYPE i.

SELECTION-SCREEN END OF BLOCK block1.

DATA: go_schaltjahr TYPE REF TO ztl_leap_year.

START-OF-SELECTION.
go_schaltjahr = NEW #(  ).
go_schaltjahr->leap( year = p_jahr ).
