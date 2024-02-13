*&---------------------------------------------------------------------*
*& Report ztw_uebung_aggregation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_uebung_aggregation.

"durchschnittlichen Sitzplätze der Economy, Business und First Class ausgeben. CARRID und CONNID ausgeben
SELECT carrid,
       connid,
       AVG( seatsocc AS DEC( 10,0 ) ) AS avg_economy, "'AVG' = durchschnittswert - 'AS' -> wird bestimmt
       AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_business,
       AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_first "'as DEC( 10,0 ) bestimmt die Decimalzahlen
  FROM sflight
 GROUP BY carrid, connid
 ORDER BY carrid ASCENDING "Carrid Spalte wird aufsteigend sortiert
 INTO TABLE @DATA(lt_flight).

cl_demo_output=>display( lt_flight ).


"Alle Buchungen nach Zeitzone ausgeben
SELECT
FROM sairport
FIELDS *
ORDER BY time_zone ASCENDING "Ascending kann weggelassen werden -> ist autom. aufsteigend. Andernfalls kann man Descending schreiben für -> Absteigend
INTO TABLE @DATA(lt_book).

cl_demo_output=>display( lt_book ).


"Durchschnittlicher Preis einer bestimmten Fluggesellschaft (LH - Lufthansa)
SELECT AVG( price AS DEC( 5,2 ) )
FROM sflight
WHERE carrid = 'LH'
INTO @DATA(lv_flight2).

WRITE: lv_flight2.


"Finde den teuersten Tarif in Tabelle 'SFLIGHT'
SELECT MAX( price )
FROM sflight
INTO @DATA(lv_price1).

WRITE: lv_price1.


"Gesamtzahl der verfügbaren Plätze aller Flüge
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
**
DATA(lv_free_seats) = ls_free_seats-max_seats - ls_free_seats-occupied_seats
                      + ls_free_seats-max_seats2 - ls_free_seats-occupied_seats2
                      + ls_free_seats-max_seats3 - ls_free_seats-occupied_seats3.

WRITE: lv_free_seats.

"Die aktuellsten 10 Flüge in der "SFLIGHT" Tabelle
SELECT
from
sflight
fields *
Order by fldate Descending
INTO TABLE @DATA(lt_flights)
UP TO 10 ROWS.


"Geben sie alle Kunden mit einer 100-er id aus
SELECT
FROM SCUSTOM
FIELDS *
where id between 99 and 199
INtO table @data(lt_mandant).
cl_demo_output=>display( lt_mandant ).


"Alle Fluggesellschaften, dessen Währung nicht 'Euro' und 'Dollar' ist

SELECT
FROM
scarr
FIELDS *
WhERE currcode <> 'EUR' and currcode <> 'USD'
INTO Table @DATA(lt_fluggesell).
cl_demo_output=>display( lt_fluggesell ).
