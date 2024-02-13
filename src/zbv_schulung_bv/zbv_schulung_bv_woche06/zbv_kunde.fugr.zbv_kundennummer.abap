FUNCTION zbv_kundennummer.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_NAME) TYPE  KNA1-NAME1
*"  EXPORTING
*"     REFERENCE(EPT_KNUMMER) TYPE  STANDARD TABLE
*"----------------------------------------------------------------------
  SELECT
  FROM kna1
  LEFT JOIN knvk ON kna1~kunnr = knvk~kunnr
  LEFT JOIN vbak ON kna1~kunnr = vbak~kunnr
  FIELDS
  kna1~kunnr AS Kundennummer,
  kna1~name1 AS Kundenname,
  kna1~stras AS Strasse,
  kna1~pstlz AS Postleitzahl,
  kna1~ort01 AS Ort,
  vbak~vbeln AS Belegnummer,
  knvk~namev AS Vorname,
  knvk~name1 AS Nachname
  WHERE kna1~name1 LIKE @ip_name                   "Like wird anstatt = benutzt, damit im Hauptprogramm die Suchhilfe mit * funktioniert.
  INTO CORRESPONDING FIELDS OF TABLE @ept_knummer. "Das Corresponding sorgt dafür, dass Tabelle richtig sortiert erstellt wird.



ENDFUNCTION.
