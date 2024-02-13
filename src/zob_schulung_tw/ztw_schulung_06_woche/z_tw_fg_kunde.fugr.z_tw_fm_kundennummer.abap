FUNCTION z_tw_fm_kundennummer.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_NAME) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(ET_KUNDE) TYPE  TABLE
*"----------------------------------------------------------------------

  SELECT kunnr as Kundennummer, name1 as Name
  FROM kna1
  where Name1 = @ip_name
  INTO table @et_kunde.


ENDFUNCTION.
