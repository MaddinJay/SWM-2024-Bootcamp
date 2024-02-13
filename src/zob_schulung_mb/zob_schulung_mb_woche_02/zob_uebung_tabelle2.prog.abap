*&---------------------------------------------------------------------*
*& Report zob_uebung_tabelle2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_tabelle2.

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
 "Cl_demo_output=>display( lt_flugdaten ).

Loop at lt_flugdaten Into DATA(ls_flugdaten). " hier wird eine Kopie der Tabelle als Struktur ausgegeben
ls_flugdaten-carrid = '123'.
Modify lt_flugdaten from ls_flugdaten.
ENDLOOP.


Loop at lt_flugdaten REFERENCE INTO data(lo_flugdaten).
lo_flugdaten->carrname = 'Lufthansa'.
endloop.

Loop at lt_flugdaten ASSIGNING FIELD-SYMBOL(<fs_flugdaten>).
<fs_flugdaten>-carrid = 999.
ENDLOOP.
