*&---------------------------------------------------------------------*
*& Report zob_parameters
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_parameters.
TABLES: mara.

PARAMETERS p_value1 TYPE p DECIMALS 2.
PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY.

SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS.

IF p_value1 is INITIAL.
  DATA(lv_message) = |geben sie bitte einen anderen Betrag als { p_value1 } ein.|.
  MESSAGE lv_message TYPE 'I'.
ENDIF.


DATA(lv_brutto) = p_value1 * '1.19'.
WRITE lv_brutto.
WRITE : / 'Produkt: ' , p_prod.
