*&---------------------------------------------------------------------*
*& Report zuh_linienflug
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_linienflug.

*Wählen Sie alle Linienflüge aus. Erweitern Sie Ihren Select Befehl so, dass der
*vollständige Name der Fluggesellschaft anstatt der ID der Airline angezeigt
*wird.
*Tabelle: SPFLI, SCARR

SELECT
 FROM spfli AS flug
 LEFT JOIN scarr AS firma
 ON flug~carrid = firma~carrid
 FIELDS
 firma~carrname AS Fluggesellschaft,
 flug~cityfrom AS von_Stadt,
 flug~cityto AS nach_Stadt
 ORDER BY Fluggesellschaft ASCENDING
 INTO TABLE @DATA(lt_join_tabelle).

cl_demo_output=>display( lt_join_tabelle ).
