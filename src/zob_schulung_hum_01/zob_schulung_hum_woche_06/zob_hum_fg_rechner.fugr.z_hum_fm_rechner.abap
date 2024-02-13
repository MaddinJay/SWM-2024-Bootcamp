FUNCTION z_hum_fm_rechner.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IP_BASIS) TYPE  INT1
*"     VALUE(IP_EXPONENT) TYPE  INT1
*"  EXPORTING
*"     REFERENCE(EP_RESULT) TYPE  INT4
*"----------------------------------------------------------------------
  ep_result = ip_basis ** ip_exponent.

ENDFUNCTION.
