*&---------------------------------------------------------------------*
*& Report zob_uebung_join2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_join2.

*Aufgabenstellung
*Verwenden Sie einen Join, um die Details aller Flüge und deren
*entsprechenden Fluggesellschaften aus den Tabellen SFLIGHT und SCARR zu
*holen.
*
Select
from sflight
left outer join scarr
on sflight~carrid = scarr~carrid
fields
sflight~carrid,
sflight~connid,
sflight~fldate,
scarr~carrname
INTO Table @Data(lt_flugdaten).
 Cl_demo_output=>display( lt_flugdaten ).
