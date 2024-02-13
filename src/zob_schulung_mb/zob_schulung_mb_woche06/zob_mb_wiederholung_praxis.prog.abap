*&---------------------------------------------------------------------*
*& Report zob_mb_wiederholung_praxis
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_wiederholung_praxis.


parameters p_land type scustom-country.
zmb_lcl_wiederholung=>abruf( iv_eingabe = p_land ).
