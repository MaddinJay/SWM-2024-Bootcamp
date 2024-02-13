*&---------------------------------------------------------------------*
*& Report z_select
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_select.

********************************************************************
**übung 1
********************************************************************
*
*SELECT FROM sbook FIELDS * WHERE passname = 'Christa Delon' INTO TABLE @DATA(lt_sbook).
*
*cl_demo_output=>display( lt_sbook ).
*
********************************************************************
**übung 2
********************************************************************
*
*
*SELECT SINGLE FROM sbook FIELDS * WHERE passname = 'Christa Delon' INTO @data(ls_sbook).
*
*cl_demo_output=>display( ls_sbook ).


*******************************************************************
*übung 3
*******************************************************************
*
*SELECT FROM spfli
*        FIELDS *
*        WHERE distance >= '5000'
*        INTO TABLE @data(lt_flights).
*
*cl_demo_output=>display( lt_flights ).
*
*
********************************************************************
**übung 4
********************************************************************
*
*SELECT FROM spfli
*FIELDS *
*WHERE  cityfrom = 'FRANKFURT'
*INTO TABLE @lt_flights.
*
*cl_demo_output=>display( lt_flights ).


*******************************************************************
* übung 5
*******************************************************************

*SELECT
*FROM scustom
*FIELDS *
*WHERE name LIKE 'S%'
*INTO TABLE @DATA(lt_flights).
*
*cl_demo_output=>display( lt_flights ).


*******************************************************************
* übung 6
*******************************************************************

*SELECT
*FROM SCARR
*FIELDS *

*******************************************************************
* übung aggregation
*******************************************************************
*
*SELECT
*  FROM sflight
*  FIELDS
*    carrid,
*    connid
*    COUNT( * ) AS amount,
*    AVG( seatsmax AS DEC( 10,0 ) ) AS avg_occupied_eco,
*    AVG( s_smax_b AS DEC( 10,0 ) ) AS avg_occupied_b,
*    AVG( s_smax_f AS DEC( 10,0 ) ) AS avg_occupied_f
*    GROUP BY carrid, connid
*    INTO TABLE @DATA( lt_aggregated ).
*
* cl_demo_output=>display( lt_aggregated ).


"Übung: Aggregation
"Sie wollen die durchschnittlichen Sitzplätze der Economy, Business und First Class wissen.
"Gruppieren Sie die Ergebnisse nach carrid und connid. Tabelle: SFLIGHT
*SELECT
*    FROM sflight
*    FIELDS
*    carrid,
*    COUNT(*) AS amount,
*    AVG( seatsocc AS DEC( 10,0 ) ) AS avg_occupied_eco,
*    AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_occupied_b,
*    AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_occupied_f
*    GROUP BY carrid
*    INTO TABLE @DATA(lt_aggregated).
*cl_demo_output=>display( lt_aggregated ).
*SELECT
*    FROM sflight
*    FIELDS
*    carrid,
*    connid,
*    COUNT(*) AS amount,
*    AVG( seatsocc AS DEC( 10,0 ) ) AS avg_occupied_eco,
*    AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_occupied_b,
*    AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_occupied_f
*    GROUP BY carrid, connid
*    ORDer by carrid
*    INTO TABLE @DATA(lt_aggregated_2).
*cl_demo_output=>display( lt_aggregated_2 ).
*



"Übung: Order by
"Geben Sie alle Buchungen aus, sortieren Sie diese nach der Zeitzone. Tabelle: SBOOK
*SELECT
*  FROM sairport
*  FIELDS
*  *
*  ORDER BY time_zone DESCENDING
*  INTO TABLE @DATA(lt_ordered).
*
*cl_demo_output=>display( lt_ordered ).
*
*
*******************************************************************
* übung geben sie die ältesten 10 flüge der flug tabelle aus. tabelle sflight.
*******************************************************************

*SELECT
*  FROM
*  sflight
*  FIELDS
*    *
*  order by fldate DESCENDING
*  INTO TABLE @DATA(lt_flights)
*  UP TO 10 rows.

*Extra Aufgaben:

"Geben Sie die ältesten 10 Flüge der Flug-Tabelle aus. Tabelle SFLIGHT.
*SELECT
*  FROM
*    SFLight
*  FIELDS
*    *
*  ORDER BY fldate DESCENDING
*  INTO TABLE @DATA(lt_flights)
*  UP TO 10 ROWS.
*
*
*   cl_demo_output=>display( lt_flights ).


"Geben Sie alle Kunden mit einer 100-er id aus. Tabelle SCUSTOM.
*SELECT
*  FROM
*    SCUSTOM
*   FIELDS
*    *
**  WHERE ID >= '100' AND id < 200
*  WHERE ID BETWEEN 100 AND 199
*  INTO TABLE @DATA(lt_mandant).
*
*  cl_demo_output=>display( lt_mandant ).

"Geben Sie die Namen aller Fluggesellschaften aus, dessen Währung nicht Dollar oder Euro ist. Tabelle: SCARR

*SELECT
*  FROM
*    SCARR
*  FIELDS
*    *
*  WHERE currcode <> 'EUR' AND currcode <> 'USD'
*  INTO TABLE @DATA(lt_mandant).
*
*  cl_demo_output=>display( lt_mandant ).

*SELECT
*  scarr~carrid,
*  scarr~carrname
*  FROM Scarr
*  LEFT OUTER JOIN spfli ON scarr~carrid = spfli~carrid
*  INTO TABLE @DATA(lt).
*
*cl_demo_output=>display( lt ).

*SELECT
*  scarr~carrid,
*  scarr~carrname
*  FROM Scarr
*  left outer join spfli on scarr~carrid = spfli~carrid
*  INTO TABLE @DATA(lt).
*
*
*cl_demo_output=>display( lt ).
*
*
*  "sflight ~ carrid "LH"

*TYPES: BEGIN OF sflight_with_carrier,
*         INCLUDE TYPE sflight,          " Die Struktur sflight inkludieren
*         carrname TYPE scarr-carrname,  " Hinzufügen einer Spalte für die Fluggesellschaft
*       END OF sflight_with_carrier.
*
*DATA: lt_result TYPE TABLE OF sflight_with_carrier,  " Interne Tabelle für die Ergebnisse
*      ls_result TYPE sflight_with_carrier.            " Einzelner Eintrag in der internen Tabelle
*
*SELECT sflight~*, scarr~carrname                  " Auswahl der Spalten aus sflight und scarr
*  INTO TABLE @lt_result                           " Speichern der Ergebnisse in der internen Tabelle
*  FROM sflight
*  INNER JOIN scarr ON sflight~carrid = scarr~carrid.  " Innerer Join zwischen sflight und scarr
*
*LOOP AT lt_result INTO ls_result.
*  " Hier können Sie auf die Ergebnisse zugreifen, z.B. ls_result-carrname
*  WRITE: / 'FlightID:', ls_result-flightid,
*         'CarrID:', ls_result-carrid,      " Hier muss es carrid sein, da es zu sflight gehört
*         'CarrName:', ls_result-carrname.
*ENDLOOP.

*SELECT
*  FROM SFLIGHT
*  LEFT OUTER JOIN scarr
*  ON SFLIGHT~carrid = scarr~carrid
*  FIELDS
*  sflight~carrid,
*  sflight~connid,
*  sflight~fldate,
*  scarr~carrname
*  INTO TABLE @DATA(lt_Fluege).
*
*cl_demo_output=>display( lt_fluege ).

*
*SELECT
*    sflight~carrid,
*    sflight~connid,
*    sflight~fldate,
*    sflight~price,
*    scarr~carrname
*  INTO TABLE @DATA(lt_fluege)
*  FROM SFLIGHT
*  LEFT JOIN scarr
*  ON sflight~carrid = scarr~carrid.
*
*  cl_demo_output=>display( lt_fluege ).


"Übung: Join
"Wählen Sie die Spalten für Airline-Code, Flugverbindungsnummer, Flugdatum, Kundenname und Sprache aus. Geben Sie maximal 20 Einträge aus.
"Tabellen: SBOOK und SCUSTOM

*SELECT
*  FROM sbook AS booking
*  INNER JOIN scustom AS customer ON customer~id = booking~customid
*  FIELDS
*    booking~carrid,
*    booking~connid,
*    booking~fldate,
*    customer~name,
*    customer~langu
*  INTO TABLE @DATA(lt_join_specific)
*  UP TO 20 ROWS.
*
*cl_demo_output=>display( lt_join_specific ).


"Extra: Flüge und Fluggesellschaften
"Verwenden Sie einen Join, um die Details aller Flüge und deren entsprechenden Fluggesellschaften aus den Tabellen SFLIGHT und SCARR zu holen.
"Tabelle: SFLIGHT, SCARR

*SELECT
*  FROM sflight AS flug
*LEFT JOIN scarr AS fluggesellschaft ON flug~carrid = fluggesellschaft~carrid "Bei diesem Beispiel würde auch INNER JOIN klappen
*FIELDS flug~carrid, flug~connid, flug~currency, flug~fldate, fluggesellschaft~carrname
*INTO TABLE @DATA(lt_details).
*
*cl_demo_output=>display( lt_details ).

"Extra: Lufthansa Flüge
"Wählen Sie alle Linienflüge der Fluggesellschaft "Lufthansa" aus.
"Tabelle: SPFLI, SCARR

*SELECT
*  FROM spfli AS flugplan
*  right JOIN scarr AS fluggesellschaft ON flugplan~carrid = fluggesellschaft~carrid
*  FIELDS
*    flugplan~carrid,
*    flugplan~connid,
*    flugplan~cityfrom,
*    flugplan~cityto,
*    fluggesellschaft~carrname
*  WHERE flugplan~carrid = 'LH' "Lufthansa
*    AND fltype <> 'X' "X = Charter '' = Linie
*  INTO TABLE @DATA(lt_flugplan).

*cl_demo_output=>display( lt_flugplan ).



"Extra: Linienflüge
"Wählen Sie alle Linienflüge aus. Erweitern Sie Ihren Select Befehl so, dass der vollständige Name der Fluggesellschaft anstatt der ID der Airline angezeigt wird. Tabelle: SPFLI, SCARR

*SELECT scarr~carrid, spfli~cityfrom, spfli~connid, spfli~cityto
*
*FROM spfli
*INNER JOIN scarr
*ON spfli~carrid = scarr~carrid
*WHERE fltype = @abap_false
*INTO TABLE @DATA(lt_lienienflug).
*
*cl_demo_output=>display( lt_lienienflug ).
*



*
*SELECT
*  FROM spfli AS flugplan
*  left JOIN scarr AS fluggesellschaft ON flugplan~carrid = fluggesellschaft~carrid
*  FIELDS
*    flugplan~connid,
*    flugplan~cityfrom,
*    flugplan~cityto,
*    fluggesellschaft~carrname
*  INTO TABLE @DATA(lt_flugplan).
*
*cl_demo_output=>display( lt_flugplan ).


"Extra: Maximale Kapazität
"Finden Sie die maximale Kapazität jeder Fluggesellschaft. Geben Sie den Namen der Fluggesellschaft mit aus.
"Tabelle: SCARR, SFLIGHT

*SELECT
*    FROM sflight AS flug
*    LEFT JOIN scarr AS fluggesellschaft ON flug~carrid = fluggesellschaft~carrid
*    FIELDS fluggesellschaft~carrname,
*      SUM( seatsmax ) AS max_seats,
*      SUM( seatsmax_b ) AS max_seats_b,
*      SUM( seatsmax_f ) AS max_seats_f,
*      SUM( seatsmax + seatsmax_b + seatsmax_f ) AS totalSum
*    GROUP BY fluggesellschaft~carrname
*    INTO TABLE @DATA(lt_maxseats).
*
*cl_demo_output=>display( lt_maxseats ).


*******************************************************************
*ausgabe mit flügen die auch garnicht fliegen
*******************************************************************
*
*SELECT
*FROM
*scarr AS fliegernamen
*LEFT OUTER JOIN sflight AS flugdaten
*ON fliegernamen~carrid = flugdaten~carrid
*FIELDS
*fliegernamen~carrname AS Flugzeug_Name,
*SUM( flugdaten~seatsmax ) AS Economy_Sitze,
*SUM( flugdaten~seatsmax_b ) AS Business_Sitze,
*SUM( flugdaten~seatsmax_f ) AS Firstclass_Sitze,
*SUM( flugdaten~seatsmax + flugdaten~seatsmax_b + flugdaten~seatsmax_f ) AS TotalSum
*GROUP BY fliegernamen~carrname "Das bedeutet, dass er es nach Namen sortiert, da kann man nicht nach Aggregationswerten sortieren sondern nach normalen feld wie name bei uns
*INTO TABLE @DATA(lt_join_maxkapazitat).
*
* cl_demo_output=>display( lt_join_maxkapazitat ).


*******************************************************************
* wie viele lieferanten in den verschiedenen ländern
*******************************************************************
*SELECT
*FROM lfa1
*FIELDS
*count( * )  as ANZAHL,
*LAND1
*GROUP BY LAND1
*INTO TABLE @DATA(lt_liefranten_pro_land).
*
*cl_demo_output=>display( lt_liefranten_pro_land ).


*******************************************************************
*geben sie die anmen aller ihrer deutschen lieferanten aus.
*******************************************************************

SELECT
  FROM lfa1
  FIELDS
    name1
  WHERE land1 = 'DE'
    INTO TABLE @DATA(lt_duetsche_lieferanten).

cl_demo_output=>display( lt_duetsche_lieferanten ).
