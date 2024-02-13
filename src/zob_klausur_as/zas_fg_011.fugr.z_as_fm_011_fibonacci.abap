FUNCTION z_as_fm_011_fibonacci.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_ZAHL1) TYPE  I
*"  EXPORTING
*"     REFERENCE(EP_RESULT) TYPE  I
*"----------------------------------------------------------------------
  DATA(lv_zahl1) = 0.
  DATA(lv_zahl2) = 0.
  DATA(lv_result) = 0.

  DO ip_zahl1 TIMES.


    ep_result = lv_zahl1 + lv_zahl2.

    lv_zahl2 = lv_zahl1.
    lv_zahl1 = ep_result.

    IF lv_zahl1 = 0.
      lv_zahl2 = 1.
    ENDIF.

  ENDDO.

ENDFUNCTION.
