*&---------------------------------------------------------------------*
*& Report zob_uebung_join5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_join5.
*Aufgabenstellung
*Finden Sie die maximale Kapazität jeder Fluggesellschaft. Geben Sie den
*Namen der Fluggesellschaft mit aus.
*Tabelle: SCARR, SFLIGHT

select
from
sflight
left outer join scarr
ON sflight~carrid = scarr~carrid
fields

scarr~carrname,
SUM( seatsmax ) as sitze,
SUM( seatsmax_b ) as sitzeb,
SUM( SEATSMAX_f ) as sitzef,
SUM( seatsmax + seatsmax_b + SEATSMAX_f ) as gesamt
GROUP BY scarr~carrname "->an jedem Tag, gibt es mehrere Flüge von einer Fluggesellschaft

into table @data(lt_max).
cl_demo_output=>display( lt_max ).

*Aufgabenstellung
*Fügen Sie dem Datensatz einen neuen Flughafen hinzu.
*Tabelle: SAIRPORT
