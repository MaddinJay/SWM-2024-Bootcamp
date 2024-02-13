*&---------------------------------------------------------------------*
*& Report zuh_fibonacci2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_fibonacci2.

DATA:
      iv_ergebniss TYPE i.

PARAMETERS: p_anzahl type i.


CALL FUNCTION 'Z_FIBONACCI'
  EXPORTING
    ip_anzahl   = p_anzahl
  IMPORTING
    ep_fibozahl = iv_ergebniss.



WRITE: / iv_ergebniss.
