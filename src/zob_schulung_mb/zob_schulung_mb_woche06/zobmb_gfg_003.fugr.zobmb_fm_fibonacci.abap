FUNCTION zobmb_fm_fibonacci.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_ZAHL) TYPE  I
*"  EXPORTING
*"     REFERENCE(EP_ERGEBNIS) TYPE  INT4
*"----------------------------------------------------------------------

  DATA(lv_fib1) = 0.
  DATA(lv_fib2) = 0.
  ep_ergebnis = 0.


  DO ip_zahl TIMES.


    ep_ergebnis = lv_fib1 + lv_fib2.

    lv_fib2 = lv_fib1.
    lv_fib1 = ep_ergebnis.

    IF lv_fib1 = 0.
      lv_fib2 = 1.
    ENDIF.

  ENDDO.

ENDFUNCTION.
