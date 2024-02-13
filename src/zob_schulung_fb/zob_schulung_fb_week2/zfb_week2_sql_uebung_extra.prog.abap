*&---------------------------------------------------------------------*
*& Report zfb_week2_sql_uebung_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_week2_sql_uebung_extra.

*   Übung Extra Langstreckenflüge - Tabelle: SPFLI
*   Finden Sie alle Flüge bei denen die Entfernung über 5000 liegt.

SELECT
  FROM spfli
    FIELDS *
    WHERE DISTANCE >= '5000'
      INTO TABLE @DATA(lt_sdistance).

*cl_demo_output=>display( lt_sdistance ).

*   Übung Extra Flüge von Frankfurt - Tabelle: SPFLI
*   Ermitteln Sie alle Flüge die von Frankfurt abfliegen.

SELECT
  FROM spfli
    FIELDS *
    WHERE AIRPFROM = 'FRA'
      INTO TABLE @DATA(lt_airport).

*cl_demo_output=>display( lt_airport ).


*   Übung Extra Nachname S* - Tabelle SCUSTOM
*   Geben Sie die Details aller Kunden aus, deren Nachname mit 'S' beginnt.

SELECT
  FROM SCUSTOM
    FIELDS *
    WHERE
    NAME LIKE 'S%'
    AND
    CUSTTYPE NOT LIKE 'B'       "Variante Firmen (B) ausschließen

      INTO TABLE @DATA(lt_name_s).

*cl_demo_output=>display( lt_name_s ).

*   Übung Extra EURO - Tabelle: SCARR
*   Geben Sie alle Fluggesellschaften aus, dessen Währung 'EUR ist.

SELECT
  FROM SCARR
    FIELDS *
    WHERE CURRCODE = 'EUR'
      INTO TABLE @DATA(lt_carrid_eur).

*cl_demo_output=>display( lt_carrid_eur ).

*   Übung Extra Teuerster Tarif - Tabelle: SFLIGHT.
*   Finden den teuersten Tarif in der Tabelle SFLIGHT.

SELECT MAX( PRICE )
  FROM SFLIGHT
  INTO TABLE @DATA(lt_highprice).
* INTO TABLE @DATA(lt_highprice).  TABLE kann raus da nur ein Wert.

* cl_demo_output=>display( lt_highprice ).

*   Übung Extra Durchschnitts-Preis - Tabelle: SFLIGHT.
*   Verwenden Sie ABAP SQL, um den durchschnittlichen Preis aller Flüge einer
*   bestimmten Fluggesellschaft in der Tabelle SFLIGHT zu berechnen.

SELECT
  FROM sflight
  FIELDS
    carrid,
    connid,
    COUNT( * ) AS amount,
    AVG( seatsocc AS DEC( 10,0 ) ) AS avg_occupied_eco,
    AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_occupied_b,
    AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_occupied_f
  GROUP BY carrid, connid
  INTO TABLE @DATA(lt_aggregated).
*
* cl_demo_output=>display( lt_aggregated ).

**** LÖSUNG DENISE *****
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
**
*cl_demo_output=>display( lt_aggregated ).

*   Übung Extra Verfügbare Plätze - Tabelle: SFLIGHT.
*   Berechnen Sie die Gesamtzahl der verfügbaren Sitze aller Flüge.

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
                      + ls_free_seats-max_seats3 - ls_free_seats-occupied_seats3 .
*WRITE lv_free_seats.

*Meine Lösung:
*SELECT AVG( price AS dec( 10,2 ) ) AS avg_price
*FROM SFLIGHT
*WHERE CARRID = 'AA'
*INTO TABLE @DATA(lt_dprice).
*
* cl_demo_output=>display( lt_dprice ).


*Übung Extra: Flüge und Fluggesellschaften - Tabellen SFLIGHT und SCARR
*Verwenden Sie einen Join, um die Details aller Flüge und deren entsprechenden Fluggesellschaften
*aus den Tabellen SFLIGHT und SCARR zu holen.

SELECT
  FROM SFLIGHT
  LEFT OUTER JOIN scarr
  ON SFLIGHT~carrid = scarr~carrid
  FIELDS
  sflight~carrid,
  sflight~connid,
  sflight~fldate,
  scarr~carrname
  INTO TABLE @DATA(lt_Fluege).

*cl_demo_output=>display( lt_fluege ).

*Variante A_Sevli:

SELECT
FROM spfli AS flugplan
RIGHT JOIN scarr AS fluggesellschaft ON flugplan~carrid = fluggesellschaft~carrid
FIELDS flugplan~carrid, flugplan~connid, flugplan~cityfrom, flugplan~cityto, fluggesellschaft~carrname
WHERE flugplan~carrid = 'LH' AND fltype <> 'X' "X = Charter '' = Linie
INTO TABLE @DATA(lt_flugplan).
*
cl_demo_output=>display( lt_flugplan ).


*Übung Extra: Lufthansa Flüge - Tabelle: SPFLI, SCARR
*Wählen Sie alle Linienflüge der Fluggesellschaft "Lufthansa" aus.

SELECT
from spfli AS flugplan
LEFT JOIN scarr AS flugges
on flugplan~carrid = flugges~carrid
FIELDS
    flugplan~carrid     AS Kuerzel,
    flugges~carrname    AS Name_FlugG,
    flugplan~airpfrom   AS Abflughafen,
    flugplan~airpto     AS Zielflughafen
  WHERE flugplan~carrid = 'LH'
    AND flugplan~fltype <> 'X'

INTO TABLE @DATA(lt_lufth).

*cl_demo_output=>display( lt_lufth ).

*Übung Extra: Linienflüge - Tabelle: SPFLI, SCARR
*Wählen Sie alle Linienflüge aus. Erweitern Sie Ihren Select Befehl so,
*dass der vollständige Name der Fluggesellschaft anstatt der ID der Airline angezeigt wird.

SELECT
from spfli AS flugplan
LEFT JOIN scarr AS flugges
on flugplan~carrid = flugges~carrid
FIELDS
    flugges~carrname    AS Name_FlugG,
    flugplan~airpfrom   AS Abflughafen,
    flugplan~airpto     AS Zielflughafen,
    flugplan~fltype     AS Charterflug
  WHERE flugplan~fltype <> 'X'
*    AND flugplan~carrid = 'LH'
INTO TABLE @DATA(lt_lufthansa).

*cl_demo_output=>display( lt_lufthansa ).


*Übung Extra: Maximale Kapazität - *Tabelle: SCARR, SFLIGHT
*Finden Sie die maximale Kapazität jeder Fluggesellschaft.

SELECT
  FROM sflight AS flug
  LEFT JOIN scarr AS fluggesellschaft ON flug~carrid = fluggesellschaft~carrid
  FIELDS fluggesellschaft~carrname,
  SUM( seatsmax ) AS max_seats,
  SUM( seatsmax_b ) AS max_seats_b,
  SUM( seatsmax_f ) AS max_seats_f,
  SUM( seatsmax + seatsmax_b + seatsmax_f ) AS totalSum
GROUP BY fluggesellschaft~carrname
INTO TABLE @DATA(ls_maxseats).

* cl_demo_output=>display( ls_maxseats ).
