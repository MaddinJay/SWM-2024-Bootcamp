*&---------------------------------------------------------------------*
*& Report zuh_fluege_von_frankfurt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_fluege_von_frankfurt.

*Aufgabenstellung
*Ermitteln Sie alle Flüge die von Frankfurt abfliegen.
*Tabelle: SPFLI

select from spfli fields * where cityfrom = 'FRANKFURT' into table @DATA(lt_flug).

cl_demo_output=>display( lt_flug ).
