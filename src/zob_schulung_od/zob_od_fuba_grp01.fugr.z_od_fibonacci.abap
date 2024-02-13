FUNCTION z_od_fibonacci.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(FIBONACCI_SUMAND1) TYPE  I
*"     REFERENCE(FIBONACCI_SUMAND2) TYPE  I
*"  EXPORTING
*"     REFERENCE(FIBONACCI_SUMME) TYPE  I
*"----------------------------------------------------------------------
Do 33 times.
fibonacci_summe = fibonacci_sumand1 + fibonacci_sumand2.
ENDDO.

ENDFUNCTION.
