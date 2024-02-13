*&---------------------------------------------------------------------*
*& Report zea_schaltjahr
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zea_schaltjahr.

PARAMETERS p_year Type i.

DATA go_year TYPE ref to zcl_ea_leap.
     go_year = NEW #( ).

go_year->leap( year = p_year ).
