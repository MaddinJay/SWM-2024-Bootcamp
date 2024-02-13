FUNCTION z_kundenauswertung.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_NAME) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(EP_KDNR) TYPE  CHAR10
*"     REFERENCE(EP_ORT) TYPE  CHAR35
*"     REFERENCE(EP_STRAS) TYPE  CHAR35
*"     REFERENCE(EP_KONTAKT) TYPE  CHAR35
*"     REFERENCE(EP_BELEG) TYPE  CHAR10
*"----------------------------------------------------------------------
  SELECT SINGLE
  FROM kna1
  LEFT JOIN knvk ON kna1~kunnr = knvk~kunnr
  LEFT JOIN vbak ON kna1~kunnr = vbak~knkli
  FIELDS
  kna1~name1 AS Kunde,
    kna1~kunnr AS Kundennr,
    kna1~ort01 AS Ort,
    kna1~stras AS Strasse,
    knvk~name1 AS Kontakt,
    vbak~vbeln AS Beleg
    WHERE kna1~name1 = @ip_name
    INTO @DATA(ls_kunde).

  ep_kdnr = ls_kunde-kundennr.
  ep_ort = ls_kunde-ort.
  ep_stras = ls_kunde-strasse.
  ep_kontakt = ls_kunde-kontakt.
  ep_beleg = ls_kunde-beleg.


ENDFUNCTION.
