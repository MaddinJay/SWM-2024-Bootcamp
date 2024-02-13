FUNCTION ZOBMB_FM_FORMS.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_NAME) TYPE  KNA1-NAME1
*"  EXPORTING
*"     REFERENCE(EPT_KNUMMER) TYPE  STANDARD TABLE
*"----------------------------------------------------------------------


  SELECT
  FROM kna1
  LEFT JOIN knvk ON kna1~KUNNR = knvk~KUNNR
  LEFT JOIN vbak ON kna1~kunnr = vbak~kunnr
  FIELDS
  kna1~kunnr AS Kundennummer,
  kna1~name1 AS Kundenname,
  kna1~stras AS Strasse,
  kna1~pstlz AS Postleitzahl,
  kna1~ort01 as Ort,
  vbak~vbeln AS Belegnummer,
  knvk~namev as Vorname,
  knvk~name1 as Nachname
  WHERE kna1~name1 LIKE @ip_name
  INTO CORRESPONDING FIELDS OF TABLE @ept_knummer.











ENDFUNCTION.
