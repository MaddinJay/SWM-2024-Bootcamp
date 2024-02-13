*&---------------------------------------------------------------------*
*& Report zbv_schulung_sql
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_schulung_sql.

TABLES: sbook.

"Übung Select 1:
"Geben Sie ale Buchungen des Kunden Christa Delon aus. Tabelle: SBOOK

DATA lt_bookings TYPE TABLE OF sbook.

DATA: BEGIN OF ls_booking,
        agencynum TYPE sbook-agencynum,
        bookid    TYPE sbook-bookid,
        passname  TYPE sbook-passname,
        test      TYPE string,
      END OF ls_booking,
      lt_bookings_extra LIKE TABLE OF ls_booking.

SELECT
   FROM
   sbook
   FIELDS
   agencynum,
   bookid
   WHERE passname = 'Christa Delon'
*    INTO CORRESPONDING FIELDS OF TABLE @lt_bookings_extra.
*    INTO TABLE @lt_bookings.
    INTO TABLE @DATA(lt_tabelle).
*cl_demo_output=>display( lt_bookings ).
*
"Übung Select 2:
"Geben Sie ale Buchungen des Kunden Christa Delon aus. Tabelle: SBOOK
SELECT SINGLE
  FROM
  sbook
  FIELDS
    agencynum,
    bookid
  WHERE passname = 'Christa Delon'
  INTO @DATA(ls_booking_2).

*cl_demo_output=>display( ls_booking_2 ).

"Extra Übung Langstreckenflüge
"Finden Sie alle Flüge bei denen die Entfernung über 5000 liegt. Tabelle: SPFLI

SELECT
  FROM
  spfli
  FIELDS
  *
  WHERE distance > 5000
  INTO TABLE @DATA(lt_flug).

*cl_demo_output=>display( lt_flug ).

"Extra Übung 2 Flüge von Frankfurt
"Ermitteln Sie alle Flüge die von Frankfurt abfliegen. Tabelle: SPFLI

SELECT
   FROM
   spfli
   FIELDS
   *
   WHERE cityfrom = 'FRANKFURT'
   INTO TABLE @DATA(lt_start).

*cl_demo_output=>display( lt_start ).

"Extra Übung 3 Nachname S*
"Geben Sie die Details aller Kunden aus, deren Nachname mit 'S' beginnt. Tabelle: SCUSTOM

SELECT
   FROM
   scustom
   FIELDS
   *
   WHERE  name LIKE 'S%'
   INTO TABLE @DATA(lt_name).

*cl_demo_output=>display( lt_name ).

"Extra Übung 4
"Geben Sie alle Fluggesellschaften aus, dessen Währung 'EUR ist. Tabelle: SCAR

SELECT
   FROM
   SCARR
   FIELDS
   CARRID,
   CARRNAME
   WHERE CURRCODE = 'EUR'
   INTO TABLE @DATA(lt_waehrung).

*cl_demo_output=>display( lt_waehrung ).

"Extra Übung 5
"Finden Sie den teuersten Tarif in der Tabelle SFLIGHT.

SELECT MAX( PRICE )
FROM
SFLIGHT
INTO @DATA(lv_max).

WRITE lv_max.


"Übung 3 normal
"Sie wollen die durchschnittlichen Sitzplätze der Economy, Business und First Class wissen.
"Gruppieren Sie die Ergebnisse nach carrid und connid. Tabelle: SFLIGHT

SELECT
 FROM sflight
 FIELDS
  carrid,
  connid,
*  COUNT(*) AS amount, "Muss nicht
  AVG( seatsocc AS DEC( 10,0 ) ) AS avg_occupied_e,
  AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_occupied_b,
  AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_occupied_f
 GROUP BY carrid, connid
 INTO TABLE @DATA(lt_aggregated).

* cl_demo_output=>display( lt_aggregated ).

"Übung 4 normal Order by
"Geben Sie alle Buchungen aus, sortieren Sie diese nach der Zeitzone. Tabelle: SBOOK

SELECT
 FROM sairport
 FIELDS
 *
 ORDER BY time_zone DESCENDING
 INTO TABLE @DATA(lt_ordered).

*cl_demo_output=>display( lt_ordered ).

"Extra Aufgabe 6: Durchschnitts Preis
"Verwenden Sie ABAP SQL, um den durchschnittlichen Preis aller Flüge einer
"bestimmten Fluggesellschaft in der Tabelle SFLIGHT zu berechnen.

SELECT
  FROM sflight
  FIELDS
    carrid,
    COUNT(*) AS amount,
    AVG( price AS DEC( 10,0 ) ) AS avg_price "10,0 bedeutet 10 Vorkomma und 0 Nachkommastellen
  GROUP BY carrid
  INTO TABLE @DATA(lt_price_flights).
*
*cl_demo_output=>display( lt_price_flights ).




"Extra Aufgabe 7: Verfügbare Plätze
"Berechnen Sie die Gesamtzahl der verfügbaren Sitze aller Flüge. Tabelle: SFLIGHT

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
                      + ls_free_seats-max_seats3 - ls_free_seats-occupied_seats3 .

WRITE lv_free_seats.

"Geben Sie die jüngsten 10 Flüge der Flug-Tabelle aus. Tabelle: SFLIGHT.

SELECT
  FROM
    SFLIGHT
   FIELDS
   *
   ORDER BY fldate DESCENDING
   INTO TABLE @DATA(lt_flights)
   UP TO 10 ROWS.

*cl_demo_output=>display( lt_flights ).

"Geben Sie alle Kunden mit einer 100-er id aus. Tabelle: SCUSTOM.

SELECT
 FROM
 SCUSTOM
 FIELDS
 *
* WHERE id >= 100 AND id < 200
WHERE id BETWEEN 100 AND 200
 ORDER BY id ASCENDING
 INTO TABLE @DATA(lt_kunde).

 cl_demo_output=>display( lt_Kunde ).

"Geben Sie die Namen aller Fluggesellschaften aus, dessen Währung nicht Dollar oder Euro ist. Tabelle: SCARR

"Geben Sie die Namen alle Flugkunden aus, die eine Anrede besitzen. Tablle: SCUSTOM.

"Geben Sie den Flug mit der Buchungsnummer 144 aus. Tabelle: SBOOK

"Geben Sie alle Flüge, die innerhalb der USA fliegen, aus. Tabelle: SPFLI.

"Geben Sie alle Flüge, die Vormittags losfliegen und die mehr als einen Tag dauern, aus. Tabelle: SPFLI.

"Geben Sie die Buchungsummen der einzelnen Tage aus. Tabelle: SFLIGHT.

"Geben Sie alle Flugkunden, deren Hausnummer 6 ist, aus. Tabelle: SCUSTOM.

"Geben Sie die Anzahl der gebuchten Flüge eines Kunden aus. Tabelle: SBOOK.
