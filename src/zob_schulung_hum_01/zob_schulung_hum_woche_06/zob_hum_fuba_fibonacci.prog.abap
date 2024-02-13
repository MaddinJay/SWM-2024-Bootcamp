*&---------------------------------------------------------------------*
*& Report zob_hum_fuba_fibonacci
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_hum_fuba_fibonacci.

DATA lv_fibonacci_ergebnis TYPE i.

CALL FUNCTION 'Z_HUM_FB_FIBONACCI2'
  EXPORTING
    ip_fibonacci_summand1 = 0
    ip_fibonacci_summand2 = 1
  IMPORTING
    ep_fibonacci_ergebnis = lv_fibonacci_ergebnis.
