**&---------------------------------------------------------------------*
**& Report zob_sql_select_simple_dw
**&---------------------------------------------------------------------*
**&
**&---------------------------------------------------------------------*
REPORT zob_sql_select_simple_dw.
***********************************************************************
*"BEispiel eines älteren Selct Befehl (Reihenfolge ist anders: Felder vor dem FROM)
*SELECT SINGLE
*  *
*  FROM sbook
*  INTO @DATA(ls).
*
**********************************************************************
*"Übung Select 1
*"Geben Sie alle Buchungen des Kunden Christa Delon aus. Tabelle: SBOOK
*DATA lt_bookings TYPE TABLE OF sbook.
*
*DATA: BEGIN OF ls_booking,
*        agencynum TYPE sbook-agencynum,
*        bookid    TYPE sbook-bookid,
*        passname  TYPE sbook-passname,
*        test      TYPE string,
*      END OF ls_booking,
*      lt_bookings_extra LIKE TABLE OF ls_booking.
*
*SELECT
*  FROM
*    sbook
*  FIELDS
*    agencynum,
*    bookid,
*    passname
*  WHERE passname = 'Christa Delon'
*  "INTO CORRESPONDING FIELDS OF TABLE @lt_bookings_extra. "Option: Daten in existierende Tabelle schreiben
*  INTO TABLE @DATA(lt_tabelle). "Option: Tabelle wir mitdeklariert
*
*cl_demo_output=>display( lt_bookings ).
*
**********************************************************************
*"Übung Select 2
*"Geben Sie eine Buchung des Kunden Christa Delon aus. Tabelle: SBOOK
*SELECT SINGLE
*  FROM  sbook
*  FIELDS
*    agencynum,
*    bookid
*  WHERE passname = 'Christa Delon'
*  INTO @DATA(ls_booking_2).
*
*cl_demo_output=>display( ls_booking_2 ).
*
**********************************************************************
*"Extra: Langstreckenflüge
*"Finden Sie alle Flüge bei denen die Entfernung über 5000 liegt. Tabelle: SPFLI
*SELECT
*  FROM
*    spfli
*  FIELDS
*    *
*  WHERE distance > 5000
*  INTO TABLE @DATA(lt_flights).
*
*cl_demo_output=>display( lt_flights ).
*
**********************************************************************
*"Extra: Flüge von Frankfurt
*"Ermitteln Sie alle Flüge die von Frankfurt abfliegen. Tabelle: SPFLI
SELECT
  FROM
    spfli
  FIELDS
    *
  WHERE airpfrom = 'FRA'
    OR cityfrom = 'FRANKFURT'
  INTO TABLE @DATA(lt_flights).
*
*cl_demo_output=>display( lt_flights ).
*
**********************************************************************
*"Extra: Nachname S*
*"Geben Sie die Details aller Kunden aus, deren Nachname mit 'S' beginnt. Tabelle: SCUSTOM
*SELECT
*  FROM
*    scustom
*  FIELDS
*    *
*  WHERE name LIKE 'S%'
*  INTO TABLE @DATA(lt_customers).
*
*cl_demo_output=>display( lt_customers ).
*
**********************************************************************
*"Extra: Euro
*"Geben Sie alle Fluggesellschaften aus, dessen Währung 'EUR ist. Tabelle: SCARR
*SELECT
*  FROM
*    scarr
*  FIELDS
*    *
*  WHERE currcode = 'EUR'
*  INTO TABLE @DATA(lt_airlines).
*
*cl_demo_output=>display( lt_airlines ).
*
***********************************************************************
*"Übung: Aggregation
*"Sie wollen die durchschnittlichen Sitzplätze der Economy, Business und First Class wissen.
*"Gruppieren Sie die Ergebnisse nach carrid und connid. Tabelle: SFLIGHT
*SELECT
*  FROM sflight
*  FIELDS
*    carrid,
*    connid,
*    COUNT( * ) AS amount,
*    AVG( seatsocc AS DEC( 10,0 ) ) AS avg_occupied_eco,
*    AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_occupied_b,
*    AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_occupied_f
*  GROUP BY carrid, connid
*  INTO TABLE @DATA(lt_aggregated).
*
*cl_demo_output=>display( lt_aggregated ).
*
***********************************************************************
*"Übung: Order by
*"Geben Sie alle Buchungen aus, sortieren Sie diese nach der Zeitzone. Tabelle: SBOOK
*SELECT
*  FROM sairport
*  FIELDS
*  *
*  ORDER BY time_zone DESCENDING
*  INTO TABLE @DATA(lt_ordered).
*
*cl_demo_output=>display( lt_ordered ).
*
**********************************************************************
*"Extra: Durchschnitts Preis
*"Verwenden Sie ABAP SQL, um den durchschnittlichen Preis aller Flüge einer bestimmten Fluggesellschaft in der Tabelle SFLIGHT zu berechnen.
*
*SELECT
*  FROM sflight
*  FIELDS
*    carrid,
*    COUNT(*) AS amount,
*    AVG( price AS DEC( 10,0 ) ) AS avg_price
*  GROUP BY carrid
*  INTO TABLE @DATA(lt_price_flights).
*
*cl_demo_output=>display( lt_price_flights ).
*
**********************************************************************
*"Extra: Teuerster Tarif
*"Finden den teuersten Tarif in der Tabelle SFLIGHT.
*
*SELECT SINGLE
*  FROM sflight
*  FIELDS
*    MAX( price ) AS max_price
*  INTO @DATA(ls_expensive_price).
*
*cl_demo_output=>display( ls_expensive_price ).
*
**********************************************************************
*"Extra: Verfügbare Plätze
*"Berechnen Sie die Gesamtzahl der verfügbaren Sitze aller Flüge. Tabelle: SFLIGHT
*
*SELECT SINGLE
*  FROM sflight
*  FIELDS
*    SUM( seatsmax ) AS max_seats_economy,
*    SUM( seatsocc ) AS occupied_seats_economy,
*    SUM( seatsmax_b ) AS max_seats_business,
*    SUM( seatsocc_b ) AS occupied_seats_business,
*    SUM( seatsmax_f ) AS max_seats_first,
*    SUM( seatsocc_f ) AS occupied_seats_first
*  INTO  @DATA(ls_seats).
*
*DATA(lv_free_seats) = ( ls_seats-max_seats_economy - ls_seats-occupied_seats_economy )
*                      + ( ls_seats-max_seats_business - ls_seats-occupied_seats_business )
*                      + ( ls_seats-max_seats_first - ls_seats-occupied_seats_first ) .
*WRITE lv_free_seats.
*
**********************************************************************
*"Extra extra Aufgaben:
*
*"Geben Sie die jüngsten 10 Flüge der Flug-Tabelle aus. Tabelle SFLIGHT.
*
*SELECT "Option 1
*  FROM
*    SFLight
*  FIELDS
*    *
*  ORDER BY fldate ASCENDING
*  INTO TABLE @DATA(lt_oldest_flights)
*  UP TO 10 ROWS.
*
*SELECT "Option 2
*  *
*  FROM sflight
*  ORDER BY fldate ASCENDING
*  INTO TABLE @DATA(lt_oldest_flights2)
*  UP TO 10 ROWS.
*
* cl_demo_output=>display( lt_oldest_flights ).
*
*
*"Geben Sie alle Kunden mit einer 100-er id aus. Tabelle SCUSTOM.
*SELECT
*  FROM scustom
*  FIELDS
*    *
* " WHERE id >= 100 AND id < 200 "Option 1
*  WHERE id BETWEEN 100 AND 199 "Option 2
*  INTO TABLE @DATA(lt_mandant).
*
*cl_demo_output=>display( lt_mandant ).
*
*
*"Geben Sie die Namen aller Fluggesellschaften aus, dessen Währung nicht Dollar oder Euro ist. Tabelle: SCARR
*SELECT
*  FROM
*  scarr
*  FIELDS
*  *
*  WHERE currcode <> 'EUR' AND currcode <> 'USD' "Option 1
* " WHERE currcode NOT LIKE 'EUR' AND currcode NOT LIKE 'USD' "Option 2
*  INTO TABLE @DATA(lt_flugges).
*
*cl_demo_output=>display( lt_flugges ).
*
*
*"Geben Sie die Namen alle Flugkunden aus, die eine Anrede besitzen. Tablle SCUSTOM.
*
*"Geben Sie den Flug mit der Buchungsnummer 144 aus. Tabelle SBOOK
*
*"Geben Sie alle Flüge, die innerhalb der USA fliegen, aus. Tabelle SPFLI.
*
*"Geben Sie alle Flüge, die Vormittags losfliegen und die mehr als einen Tag dauern, aus. Tabelle SPFLI.
*
*"Geben Sie die Buchungsummen der einzelnen Tage aus. Tabelle SFLIGHT.
*
*"Geben Sie alle Flugkunden, deren Hausnummer 6 ist, aus. Tabelle SCUSTOM.
*
*"Geben Sie die Anzahl der gebuchten Flüge eines Kunden aus. Tabelle SBOOK.
