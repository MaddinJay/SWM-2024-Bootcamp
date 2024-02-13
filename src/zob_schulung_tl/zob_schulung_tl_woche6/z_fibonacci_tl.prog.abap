*&---------------------------------------------------------------------*
*& Report z_fibonacci_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fibonacci_tl.

DATA: lv_ergebnis TYPE int4.

CALL FUNCTION 'Z_TL_FM'
EXPORTING ip_zahl = 7
IMPORTING
          ep_ergebnis = lv_ergebnis.

WRITE lv_ergebnis.
