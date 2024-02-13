*&---------------------------------------------------------------------*
*& Report zuh_aggregation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_aggregation.

*Aufgabenstellung
*Sie wollen die durchschnittlichen Sitzplätze der Economy, Business und First
*Class wissen.
*Gruppieren Sie die Ergebnisse nach carrid und connid.
*Tabelle: SFLIGHT

*Tables: sflight.
*
*select AVG( sflight.seatsocc, sflight.seatsocc_b sflight.seatsocc_f ) from sflight fields *


SELECT
 FROM sflight
 FIELDS
 carrid,
 connid,
* COUNT(*) AS amount,    *wird nicht benötigt Zähler wie oft die Kombinationen vorkommen
 AVG( seatsocc AS DEC( 10,0 ) ) AS avg_occupied_eco,
 AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_occupied_b,
 AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_occupied_f
 GROUP BY carrid, connid
 order by carrid ASCENDING
 INTO TABLE @DATA(lt_flugtabelle).

cl_demo_output=>display( lt_flugtabelle ).
