*&---------------------------------------------------------------------*
*& Report zob_uebung_aggregation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_aggregation.

*Sie wollen die durchschnittlichen Sitzplätze der Economy, Business und First
*Class wissen.
*Gruppieren Sie die Ergebnisse nach carrid und connid.
*Tabelle: SFLIGHT

*SELFIELDS
* ECT
* FROM sflight
* carrid,
* connid,
* COUNT(*) AS amount,
* AVG( seatsocc AS DEC( 10,0 ) ) AS avg_occupied_eco,
* AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_occupied_b,
* AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_occupied_f
* GROUP BY carrid, connid
* INTO TABLE @DATA(lt_aggregated).
* Cl_demo_output=>display( lt_aggregated ).

*Geben Sie alle Buchungen aus, sortieren Sie diese nach der Zeitzone.
*Tabelle: SBOOK

SELECT
 FROM sairport
 FIELDS
 *
 ORDER BY time_zone DESCENDING
 INTO TABLE @DATA(lt_ordered).
 Cl_demo_output=>display( lt_ordered ).
