FUNCTION z_st_fm_kunden.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IP_PARAMETER) TYPE  KNA1-NAME1
*"  EXPORTING
*"     REFERENCE(ET_KUNDENDATEN) TYPE  STANDARD TABLE
*"----------------------------------------------------------------------



  SELECT
  FROM
  kna1 AS kunde
  LEFT JOIN vbak AS verkauf ON kunde~kunnr = verkauf~kunnr
  LEFT JOIN knvk AS kontakt ON kunde~kunnr = kontakt~kunnr
  FIELDS
  kunde~kunnr AS kundennummer,
  kunde~name1 AS kundenname,
  kunde~stras AS strasse,
  kunde~pstlz AS plz,
  kunde~ort01 AS ort,
  kunde~land1 AS land,
  verkauf~vbeln AS verkaufsbeleg,
  kontakt~namev AS kontaktvorname,
  kontakt~name1 AS kontaktnachname
  WHERE kunde~name1 = @ip_parameter
*  WHERE kunde~ort01 LIKE @ip_parameter
  INTO CORRESPONDING FIELDS OF TABLE @et_kundendaten.





ENDFUNCTION.
