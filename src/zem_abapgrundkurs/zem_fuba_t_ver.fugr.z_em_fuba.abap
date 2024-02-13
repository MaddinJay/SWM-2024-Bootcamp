FUNCTION z_em_fuba.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_V)
*"  EXPORTING
*"     REFERENCE(EV_V2)
*"----------------------------------------------------------------------
ev_v2 = iv_v + 1.

Write: ev_v2, /.


        endfunction.
