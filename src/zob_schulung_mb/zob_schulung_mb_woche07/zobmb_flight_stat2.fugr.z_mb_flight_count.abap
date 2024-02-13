function z_mb_flight_count.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_FLUGGESELL) TYPE  SCARR-CARRID
*"  EXPORTING
*"     REFERENCE(EPT_ANZAHL) TYPE  STANDARD TABLE
*"----------------------------------------------------------------------
select
from scarr
left join sbook on scarr~carrid = sbook~carrid
fields
scarr~carrid AS ID,
scarr~carrname AS Fluggesellschaft,
sbook~fldate AS Flugdatum,
Count( sbook~fldate ) as Anzahl
GROUP BY scarr~carrid, scarr~carrname, sbook~fldate


INTO CORRESPONDING FIELDS OF TABLE @ept_anzahl.

ENDFUNCTION.
