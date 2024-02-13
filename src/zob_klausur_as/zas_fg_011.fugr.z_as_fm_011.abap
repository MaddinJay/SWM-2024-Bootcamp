FUNCTION z_as_fm_011.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_BASIS) TYPE  INT1
*"     REFERENCE(IP_EXPONENT) TYPE  INT1
*"  EXPORTING
*"     REFERENCE(EP_RESULT) TYPE  INT4
*"----------------------------------------------------------------------
  ep_result = ip_basis ** ip_exponent.



ENDFUNCTION.
