FUNCTION z_aw_fm_fibonacci.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IP_ZAHL1) TYPE  I
*"     VALUE(IP_ZAHL2) TYPE  I
*"  EXPORTING
*"     REFERENCE(EP_FIBO) TYPE  I
*"----------------------------------------------------------------------
  DO 5 TIMES.

    ep_fibo = ip_zahl1 + ip_zahl2.        "ep_fibo = 0 + 1
    ip_zahl1 = ip_zahl2.                  "ip_zahl1 = 1 (Wert von ip_zahl1 wird geändert)
    ip_zahl2 = ep_fibo.                   "ip_zahl2 = 1 (Wert vom Ergebnis wird geändert)


  ENDDO.

* 0+1=1 -> 1+1=2 -> 1+2=3 -> 2+3=5 -> 3+5=8 / Ausgabe im Programm ist 8 bei Schleifendurchlauf 5 x


ENDFUNCTION.
