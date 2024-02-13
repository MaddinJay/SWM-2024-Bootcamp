FUNCTION z_obas_fm_011.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_SUMMAND1) TYPE  I
*"  EXPORTING
*"     REFERENCE(EP_SUMME) TYPE  I
*"----------------------------------------------------------------------
  DATA lv_summand1 TYPE i VALUE 0.
  DATA lv_summand2 TYPE i VALUE 1.
  ep_summe = lv_summand2.
*  WRITE ep_summe.
*  lv_summand2 = 1.

  DO ip_summand1 TIMES.
    WRITE: ep_summe, /.
    ep_summe = lv_summand1 + lv_summand2.
    lv_summand1 = lv_summand2.
    lv_summand2 = ep_summe.

  ENDDO.

ENDFUNCTION.
