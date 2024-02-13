FUNCTION z_obtl_fm.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_BASIS) TYPE  I
*"     REFERENCE(IP_EXPONENT) TYPE  I
*"  EXPORTING
*"     REFERENCE(EP_RESULT) TYPE  INT4
*"----------------------------------------------------------------------
*Berechnung programmieren
ep_result = ip_basis ** ip_exponent.




ENDFUNCTION.
