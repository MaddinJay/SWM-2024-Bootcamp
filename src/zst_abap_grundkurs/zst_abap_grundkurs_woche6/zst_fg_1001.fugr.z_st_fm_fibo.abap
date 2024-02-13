FUNCTION z_st_fm_fibo.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IP_FIBONACCI_SUMMAND1) TYPE  I
*"     VALUE(IP_FIBONACCI_SUMMAND2) TYPE  I
*"     VALUE(IP_PARAMETER) TYPE  I
*"  EXPORTING
*"     REFERENCE(EX_FIBONACCI_SUMME) TYPE  I
*"----------------------------------------------------------------------
  DO ip_parameter TIMES.

     ex_fibonacci_summe = ip_fibonacci_summand1 + ip_fibonacci_summand2.
    ip_fibonacci_summand1 = ip_fibonacci_summand2.
    ip_fibonacci_summand2 = ex_fibonacci_summe.

WRITE: ex_fibonacci_summe, '|'. " Kein Write-Befehl im FuBa -> eher in eine Tabelle schreiben und die dann ausgeben.

  ENDDO.

ENDFUNCTION.
