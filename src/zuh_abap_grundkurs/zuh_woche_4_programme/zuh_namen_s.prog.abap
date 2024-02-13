*&---------------------------------------------------------------------*
*& Report zuh_namen_s
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_namen_s.

*Geben Sie die Details aller Kunden aus, deren Nachname mit 'S' beginnt.
*Tabelle: SCUSTOM


SELECT FROM scustom FIELDS * WHERE name LIKE 'S%' INTO TABLE @DATA(lt_Kunden).

cl_demo_output=>display( lt_kunden ).
