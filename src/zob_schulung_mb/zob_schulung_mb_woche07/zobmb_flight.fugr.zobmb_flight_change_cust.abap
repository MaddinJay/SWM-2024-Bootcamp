function zobmb_flight_change_cust.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_KUNDENNR) TYPE  KNA1-KUNNR
*"  EXPORTING
*"     REFERENCE(EPT_NAME) TYPE  STANDARD TABLE
*"----------------------------------------------------------------------
select
from kna1
fields
kunnr AS Kundennummer,
name1 AS Kundenname
where kunnr = @ip_kundennr
INTO CORRESPONDING FIELDS OF TABLE @ept_name.

ENDFUNCTION.
