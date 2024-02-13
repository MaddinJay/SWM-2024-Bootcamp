*&---------------------------------------------------------------------*
*& Report z_uebung_tablle_ea
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_tablle_ea.

PARAMETERS p_geld TYPE p DECIMALS 2 OBLIGATORY.


DATA: BEGIN OF ls_geld,
        EURO   TYPE p DECIMALS 2,
        DOLLAR TYPE p DECIMALS 2,
      END OF ls_geld,
   lt_geld LIKE TABLE OF ls_geld.

ls_geld-euro    = '1.00'.
ls_geld-dollar  = '1.09'.

DO 1000 TIMES.
  APPEND ls_geld TO lt_geld.
  ls_geld-EURO    = ls_geld-euro + 1.
  ls_geld-DOLLAR  = ls_geld-DOLLAR + p_geld.
  ENDDO.

cl_demo_output=>display(  DATA = lt_geld ).
