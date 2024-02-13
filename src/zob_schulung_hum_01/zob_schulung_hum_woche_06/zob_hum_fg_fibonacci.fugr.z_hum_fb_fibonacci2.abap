FUNCTION z_hum_fb_fibonacci2.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IP_FIBONACCI_SUMMAND1) TYPE  I
*"     VALUE(IP_FIBONACCI_SUMMAND2) TYPE  I
*"  EXPORTING
*"     REFERENCE(EP_FIBONACCI_ERGEBNIS) TYPE  I
*"----------------------------------------------------------------------
DO 40 times.
ep_fibonacci_ergebnis = ip_fibonacci_summand1 + ip_fibonacci_summand2.
ip_fibonacci_summand1 = ip_fibonacci_summand2.
ip_fibonacci_summand2 = ep_fibonacci_ergebnis.

WRITE: ep_fibonacci_ergebnis, '|'.

ENDDO.

ENDFUNCTION.
