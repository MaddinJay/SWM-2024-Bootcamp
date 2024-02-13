*&---------------------------------------------------------------------*
*& Report zob_uebung_join4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_join4.

*Wählen Sie alle Linienflüge aus. Erweitern Sie Ihren Select Befehl so, dass der
*vollständige Name der Fluggesellschaft anstatt der ID der Airline angezeigt
*wird.
*Tabelle: SPFLI, SCARR

Select
from
spfli
left outer join scarr
on spfli~carrid = scarr~carrid

fields
spfli~connid,
spfli~airpfrom,
spfli~fltime,
scarr~carrname

INTO TABLE @DATA(lt_lufthansa).
Cl_demo_output=>display( lt_lufthansa ).
