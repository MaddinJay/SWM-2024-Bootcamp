FUNCTION zbv_fm_fibonacci.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_ZAHL) TYPE  I
*"  EXPORTING
*"     REFERENCE(EP_ERGEBNIS) TYPE  I
*"----------------------------------------------------------------------
  DATA gv_summand1 TYPE i VALUE 0.
  DATA gv_summand2 TYPE i VALUE 0.
  ep_ergebnis = 0.


  DO ip_zahl TIMES.

    ep_ergebnis = gv_summand1 + gv_summand2.

    gv_summand2 = gv_summand1.
    gv_summand1 = ep_ergebnis.

    IF gv_summand1 = 0.
      gv_summand2 = 1.
    ENDIF.
  ENDDO.

ENDFUNCTION.
