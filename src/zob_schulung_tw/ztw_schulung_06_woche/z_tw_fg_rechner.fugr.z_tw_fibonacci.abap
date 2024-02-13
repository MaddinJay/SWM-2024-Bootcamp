FUNCTION Z_TW_FIBONACCI.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IP_ZAHL1) TYPE  I
*"     VALUE(IP_ZAHL2) TYPE  I
*"  EXPORTING
*"     REFERENCE(EP_FIBO) TYPE  I
*"----------------------------------------------------------------------

  DO 5 TIMES.

    ep_fibo = ip_zahl1 + ip_zahl2.
    ip_zahl1 = ip_zahl2.
    ip_zahl2 = ep_fibo.

  ENDDo.

ENDFUNCTION.
