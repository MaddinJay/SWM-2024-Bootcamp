*&---------------------------------------------------------------------*
*& Report zob_uebung_join3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_join3.

*Aufgabenstellung
*Wählen Sie alle Linienflüge der Fluggesellschaft "Lufthansa" aus.
*Tabelle: SPFLI, SCARR
*Wählen Sie nicht alle Spalten beider Tabellen aus, da die
*Anzeigeausgabemethode nicht alle Spalten anzeigen kann


Select
from
spfli
left join scarr
on spfli~carrid = scarr~carrid

fields
spfli~connid,
spfli~airpfrom,

scarr~currcode,
scarr~carrname

where scarr~carrname = 'Lufthansa' and spfli~fltype <> 'X'
INTO TABLE @DATA(lt_lufthansa).
Cl_demo_output=>display( lt_lufthansa ).
