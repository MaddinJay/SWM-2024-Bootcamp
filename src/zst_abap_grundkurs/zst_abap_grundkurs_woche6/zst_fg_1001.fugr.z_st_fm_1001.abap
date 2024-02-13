FUNCTION Z_ST_FM_1001.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_BASIS) TYPE  I
*"     REFERENCE(IP_EXPONENT) TYPE  I
*"  EXPORTING
*"     REFERENCE(EP_RESULT) TYPE  INT4
*"----------------------------------------------------------------------

ep_result = ip_basis ** ip_exponent.

ENDFUNCTION.
