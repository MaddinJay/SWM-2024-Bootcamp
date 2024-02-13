function zobmb_fm_kunde.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_NAME) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(EP_KDNR) TYPE  CHAR10
*"     REFERENCE(EP_STRASSE) TYPE  CHAR35
*"     REFERENCE(EP_ORT) TYPE  CHAR35
*"     REFERENCE(EP_KONTAKT) TYPE  CHAR35
*"     REFERENCE(EP_VERKAUFSDOKU) TYPE  CHAR10
*"----------------------------------------------------------------------
*Tabellen: KNA1, KNVK,VBAK
select Single
from kna1
left join knvk ON kna1~kunnr = knvk~kunnr
left join vbak ON kna1~kunnr = vbak~knkli
FIELDS
kna1~kunnr as Kundennr,
  kna1~ort01 as Ort,
  kna1~stras as Strasse,
  knvk~name1 as Kontakt,
  vbak~vbeln as Verkaufsdoku

  where kna1~name1 = @ip_name

  into @DATA(ls_Kunde).

  ep_kdnr = ls_kunde-kundennr.
  ep_strasse = ls_kunde-strasse.
  ep_ort = ls_kunde-ort.
  ep_kontakt = ls_kunde-kontakt.
  ep_verkaufsdoku = ls_kunde-verkaufsdoku.


ENDFUNCTION.
