*&---------------------------------------------------------------------*
*& Report zob_mb_fibonacci
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_fibonacci.



 DATA: lv_ergebnis TYPE int4.

CALL FUNCTION 'ZOBMB_FM_FIBONACCI'  "es muss alles groß geschrieben werden!!
EXPORTING ip_zahl = 5
IMPORTING
          ep_ergebnis = lv_ergebnis.

WRITE lv_ergebnis.
