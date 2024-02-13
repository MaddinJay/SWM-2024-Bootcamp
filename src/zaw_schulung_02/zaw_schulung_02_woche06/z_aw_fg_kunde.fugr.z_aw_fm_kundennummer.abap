FUNCTION z_aw_fm_kundennummer.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_NAME) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(ET_KUNDE) TYPE  TABLE
*"----------------------------------------------------------------------
  SELECT
  FROM kna1
  FIELDS
  kunnr AS Kundennummer,
  name1 AS Name
  WHERE name1 = @ip_name
  INTO TABLE @et_kunde.




ENDFUNCTION.
