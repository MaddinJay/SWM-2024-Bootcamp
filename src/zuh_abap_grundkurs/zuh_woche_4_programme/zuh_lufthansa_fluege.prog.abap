*&---------------------------------------------------------------------*
*& Report zuh_lufthansa_fluege
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_lufthansa_fluege.

*Wählen Sie alle Linienflüge der Fluggesellschaft "Lufthansa" aus.
* Wählen sie nicht alle Spalten aus
*Tabelle: SPFLI, SCARR

SELECT
 FROM spfli AS flug
  LEFT JOIN scarr AS firma
 ON flug~carrid = firma~carrid
 FIELDS
 flug~carrid AS Gesellschaft_ID,
 flug~cityfrom AS von_Stadt,
 flug~cityto AS nach_Stadt,
 firma~url AS url
 WHERE flug~carrid = 'LH' and flug~fltype <> 'X'
 INTO TABLE @DATA(lt_join_tabelle).

cl_demo_output=>display( lt_join_tabelle ).
