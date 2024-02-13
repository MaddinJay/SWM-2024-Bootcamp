*&---------------------------------------------------------------------*
*& Report zaggregation_und_orderby_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaggregation_und_orderby_tl.

************************************************************************
"Aggregation"
*Sie wollen die durchschnittlichen Sitzplätze der Economy, Business und First Class wissen.
*Gruppieren Sie die Ergebnisse nach carrid und connid.
*Tabelle: SFLIGHT
************************************************************************
SELECT
FROM
sflight
FIELDS "Spalten connid und carrid auswählen, da wir danach grupieren werden
carrid,
connid,
COUNT(*) AS amount,
AVG( seatsocc AS DEC( 10,0 ) ) AS avg_occupied_eco, "economy
AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_occupied_b, "business class
AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_occupied_f  "first class
GROUP BY "Gruppieren nach carrid und connid
carrid,
connid
INTO TABLE @DATA(lt_durchpreis). "tabelle deklariert + ausgegeben
cl_demo_output=>display( lt_durchpreis ).



************************************************************************
"Order By"
*Geben Sie alle Buchungen aus, sortieren Sie diese nach der Zeitzone.
*Tabelle: SAIRPORT
************************************************************************
SELECT
FROM
sairport
FIELDS *
ORDER BY time_zone DESCENDING
INTO TABLE @DATA(lt_zeitzone).
cl_demo_output=>display( lt_zeitzone ).
