FUNCTION z_fd_potenz_berechnen.
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
