*&---------------------------------------------------------------------*
*& Report zbv_fibonacci_bv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_fibonacci_bv.

DATA lv_ergebnis TYPE i.


CALL FUNCTION 'ZBV_FM_FIBONACCI'
  EXPORTING
    ip_zahl     = 7
  IMPORTING
    ep_ergebnis = lv_ergebnis.

WRITE lv_ergebnis.
