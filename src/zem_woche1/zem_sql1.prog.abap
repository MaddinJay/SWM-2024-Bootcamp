*&---------------------------------------------------------------------*
*& Report zem_sql1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_sql1.

*
*Data: gt_sbook like table of SBOOK,
*      gs_sbook type SBOOK.
*
*
*SELECT * FROM SBOOK INTO table gt_sbook Where passname = 'Christa Delon'. "Selection einer Information aus der ganzen Tabelle *
*
*Loop at gt_sbook into gs_sbook.             "Nur ausgewählte Spaltenb werden ausgegeben.
*Write: gs_sbook-passname, gs_sbook-BOOKID.
*Endloop.
**
*
*cl_demo_output=>display( gt_sbook ). " Tabelle wird über ein eigenes Fenster ausgegeben
*
*
*Data: gs_sbook2 type sbook.
*
*SELECT "SINGLE   " Einzelnen Datensatz auslesen                      "
*FROM sbook
*FIELDS  *
*Where
*  passname = 'Christa Delon'
**into table @gt_sbook.
*
*INTO TABLE @Data(gt_sbook3).     "Tabelle wird so gleich deklariert.
*
*
*cl_demo_output=>display( gt_sbook3 ).



*INTO CORRESPONDING FIELDS of Tabel @gt_sbook.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*Übungen Tabelle SPFLI - Ausgabe Flugdistanz kleiner 5000 und Abflug aus Frankfurt.

*Data: lt_spfli like table of Spfli.
*
*
*SELECT * FROM SPFLI INTO table lt_spfli Where DISTANCE > 5000.
*
*SELECT * FROM SPFLI INTO TABLE lt_spfli where AIRPFROM Like 'FRA'.
*
*cl_demo_output=>display( lt_spfli ).


**********************************************************************
*Übungen Tabelle SCUSTOM - alles mit S soll ausgelesen werden


*Select
*From SCUSTOM
*FIELDS *
*Where name like 'S%'
*into table @Data(lt_scustom).
*
*cl_demo_output=>display( lt_scustom ).


**********************************************************************
*Übung Tabelle SCARR

*Data ls_scarr type scarr.
*
*
*Select from scarr fields * where currcode = 'EUR' into table @Data(lt_scarr).
*
*cl_demo_output=>display( lt_scarr ).

**********************************************************************
*Übung Tabelle SFLIGHT - den teuersten tarif ausgeben.


DATA: max_price TYPE sflight-price.

SELECT MAX( price ) INTO max_price FROM sflight.
WRITE: max_price.


*cl_demo_output=>display( lt_sflight ).

**********************************************************************
*Übung Tabelle sflight - Durchschnittlichen Preis für eine Fluggesellschaft ausgeben

*Parameters p_carrid type string.
*
*Data: avg_price type sflight-price.
*
*      Select avg( price ) into avg_price from sflight where carrid = p_carrid.
*
* Write avg_price.

**********************************************************************
*Übung Tabelle SFligt - durchschnittliche freie Sitzplätze der Economy, Business, First Class.
*Gruppiert nach Carrid und Connid. (maximale Sitzplätze minus belegte Sitzplätze

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
***
*DATA(lv_free_seats) = ( ls_seats-max_seats_economy - ls_seats-occupied_seats_economy )
*                      + ( ls_seats-max_seats_business - ls_seats-occupied_seats_business )
*                      + ( ls_seats-max_seats_first - ls_seats-occupied_seats_first ) .
*WRITE lv_free_seats.

**********************************************************************
*Zeitzonen sortiert aus Tabelle sairport aus Tabellenausgeben.

select
from sairport
fields *
order by time_zone
into table @Data(lt_airport).

cl_demo_output=>display( lt_airport ).
*
***********************************************************************
*
"Übung: Aggregation
"Sie wollen die durchschnittlichen Sitzplätze der Economy, Business und First Class wissen.
"Gruppieren Sie die Ergebnisse nach carrid und connid. Tabelle: SFLIGHT

*SELECT
*  FROM sflight
*  FIELDS
*    carrid,
*    connid,
*    COUNT( * ) AS amount,
*    AVG( seatsocc AS DEC( 10,0 ) ) AS avg_occupied_eco,
*    AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_occupied_b,
*    AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_occupied_f
*  GROUP BY carrid, connid " HAVING carrid = 'LH' " having bei GROUP BY ist das gleiche wie where
*  INTO TABLE @DATA(lt_aggregated).
*
*cl_demo_output=>display( lt_aggregated ).

**********************************************************************
*Tabelle spfli. Summe aller flugzeiten gruppiert nach carrid (Fluggesellschaft)
*Auf zwei stellen hinter dem Komma begrenzt


*Select
*from spfli
*Fields carrid,
*avg( fltime as dec(  10,3 ) ) as Summe
*Group by carrid
*into Table @data(lt_spfli).
*
*cl_demo_output=>display(  lt_spfli ).

**********************************************************************
*Tabelle SBOOK - Alle Flüge sortiert nach carrid
*Data lt_tabelle like TABLE OF spfli.
*
*select
*from spfli
*fields *
*ORDER BY carrid ASCENDING
*into Table @lt_tabelle.
*
*cl_demo_output=>display(  lt_tabelle ).

**********************************************************************
*Tabelle: scustom. Die Flug Id von 100 - 200.

*Select
*FROM scustom
*fields *
**Where id >= 100 and id < 200.
*Where ID Between 100 And 199
*into table @Data(lt_scustom).

**********************************************************************
*Tabelle scarr. Alle Daten ohne Euro und Dollar.

*Select
*from scarr
*Fields *
*Where currcode not like 'EUR' and currcode <> 'USD' " NOT LIKE und <> ist das gleiche
*Into table @Data(lt_scarr).
*
*cl_demo_output=>display(  lt_scarr ).
