*&---------------------------------------------------------------------*
*& Report zuh_tabellenabfrage
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_tabellenabfrage.

SELECT FROM scustom FIELDS * INTO TABLE @DATA(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).
