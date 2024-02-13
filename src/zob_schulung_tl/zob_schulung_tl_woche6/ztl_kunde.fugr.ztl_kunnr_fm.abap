FUNCTION ztl_kunnr_fm.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_NAME) TYPE  KNA1-NAME1
*"  EXPORTING
*"     REFERENCE(EP_KUNNR) TYPE  STANDARD TABLE
*"----------------------------------------------------------------------
*Tabelle KNA1 Firmennamen, Adresse, Kundennummer
*Tabelle KNVK Kontaktpersonen, Kundennummer
*Tabelle VBAK Verkaufsdokumente


  SELECT
  FROM
  kna1 AS firmen
  LEFT OUTER JOIN knvk AS kontakt ON firmen~kunnr = kontakt~kunnr
  LEFT OUTER JOIN vbak AS verkauf ON firmen~kunnr = verkauf~kunnr
  FIELDS
  firmen~name1 AS Kundenname,
  firmen~kunnr AS Kundennummer,
  firmen~ort01 AS Ort,
  firmen~stras AS Strasse,
  kontakt~namev AS Vorname,
  kontakt~name1 AS Name,
  verkauf~vbeln AS Verkaufsbeleg

  WHERE firmen~name1 LIKE @ip_name
  INTO CORRESPONDING FIELDS OF TABLE @ep_kunnr.



ENDFUNCTION.
