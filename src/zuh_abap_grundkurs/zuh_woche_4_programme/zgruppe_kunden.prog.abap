*&---------------------------------------------------------------------*
*& Report zgruppe_kunden
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgruppe_kunden.

selection-screen Begin of Block Suche with frame Title Text-001.
PARAMETERS: p_name(25) TYPE c LOWER CASE OBLIGATORY.

SELECTION-SCREEN end of block Suche.


SELECT
 FROM scustom
 FIELDS *

where name = @p_name
into table @Data(lt_kunde).

loop at lt_kunde into DATA(ls_kunde).
ENDLOOP.

if p_name = ls_kunde-name.
cl_demo_output=>display( lt_kunde ).
elseif

p_name <> ls_kunde-name.
message 'Kunde wurde nicht gefunden' TYPE 'I'.
endif.





cl_demo_output=>display( lt_kunde ).
