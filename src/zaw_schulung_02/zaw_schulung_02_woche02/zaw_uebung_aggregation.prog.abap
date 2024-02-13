*&---------------------------------------------------------------------*
*& Report zaw_uebung_aggregation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_aggregation.

*Sie wollen die durchschnittlichen Sitzplätze der Economy, Business und First Class wissen.
*Gruppieren Sie die Ergebnisse nach carrid und connid. Tabelle: SFLIGHT

SELECT carrid AS Fluggesellschaft, connid AS id,
AVG( seatsocc AS DEC( 10,0 ) ) AS economy,
AVG( seatsocc_b AS DEC( 10,0 ) ) AS business,
AVG( seatsocc_f AS DEC( 10,0 ) ) AS first
FROM sflight
GROUP BY carrid, connid
ORDER BY carrid ASCENDING,
         connid ASCENDING
INTO TABLE @DATA(lt_flight).

cl_demo_output=>display( lt_flight ).


*Geben Sie alle Buchungen aus, sortieren Sie diese nach der Zeitzone. Tabelle: SAIRPORT

SELECT
FROM sairport
FIELDS *
ORDER BY time_zone
INTO TABLE @DATA(lt_airport).

cl_demo_output=>display( lt_airport ).


*Finden den teuersten Tarif in der Tabelle SFLIGHT

SELECT MAX( price )
FROM sflight
INTO @DATA(lv_price).

WRITE: / |Teuerster Tarif: { lv_price } Euro.|.


*Berechnen Sie den durchschnittlichen Preis aller Flüge einer bestimmten Fluggesellschaft in der Tabelle: SFLIGHT.

SELECT AVG( price as DEC( 15,2 ) ) "Angabe der Dezimalstellen für den Durchschnittswert
FROM sflight
WHERE carrid = 'LH'
INTO @DATA(lv_flight).

WRITE: / |Durchschnittspreis: { lv_flight } Euro.|.


*Berechnen Sie die Gesamtzahl der verfügbaren Sitze aller Flüge, Tabelle: SFLIGHT.

SELECT SINGLE
  FROM sflight
  FIELDS
    SUM( seatsmax ) AS max_seats,
    SUM( seatsocc ) AS occupied_seats,
    SUM( seatsmax_b ) AS max_seats2,
    SUM( seatsocc_b ) AS occupied_seats2,
    SUM( seatsmax_f ) AS max_seats3,
    SUM( seatsocc_f ) AS occupied_seats3
  INTO  @DATA(ls_free_seats).

DATA(lv_free_seats) = ls_free_seats-max_seats - ls_free_seats-occupied_seats
                      + ls_free_seats-max_seats2 - ls_free_seats-occupied_seats2
                      + ls_free_seats-max_seats3 - ls_free_seats-occupied_seats3.

WRITE: / |Verfügbare Plätze: { lv_free_seats }.|.
