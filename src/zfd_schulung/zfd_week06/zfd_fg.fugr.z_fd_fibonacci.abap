FUNCTION z_fd_fibonacci.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_WIEOFT) TYPE  I
*"  EXPORTING
*"     REFERENCE(EV_FIBO_SUMME) TYPE  I
*"----------------------------------------------------------------------
DATA: gv_fibonacci_summand1 TYPE i value 0.
DATA: gv_fibonacci_summand2 TYPE i value 1.
DATA: gv_fibonacci_summe TYPE i.

DO iv_wieoft TIMES.

  gv_fibonacci_summe = gv_fibonacci_summand1 + gv_fibonacci_summand2.
  gv_fibonacci_summand1 = gv_fibonacci_summand2.
  gv_fibonacci_summand2 = gv_fibonacci_summe.

ENDDO.

ev_fibo_summe = gv_fibonacci_summe.

ENDFUNCTION.
