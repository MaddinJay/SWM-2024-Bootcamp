*&---------------------------------------------------------------------*
*& Report zextra_aufgabe_fluege
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zextra_aufgabe_fluege.
*****************************************************************************************
*Extra: Flüge und Fluggesellschaften
*Aufgabenstellung: Verwenden Sie einen JOIN, um die Details aller Flüge
*und deren entsprechenden Fluggesellschaften aus den Tabellen SFLIGHT und SCARR zu holen.
*****************************************************************************************
SELECT
FROM
sflight AS flights "Namensgebung ist optional, muss nicht sein
LEFT OUTER JOIN scarr AS flugzeuge "LEFT OUTER JOIN verbindet die linke tabelle mit rechte zusammen
ON flights~carrid = flugzeuge~carrid
FIELDS
flights~carrid AS Flugzeug_ID,
flights~connid AS Flugverbindung,
flights~fldate AS Flugdatum,
flugzeuge~carrname AS Flugzeugname
INTO TABLE @DATA(lt_join_flightsinfo).

*cl_demo_output=>display( lt_join_flightsinfo ).


*****************************************************************************************
*Extra: Lufthansa Flüge
*Wählen Sie alle Linienflüge der Fluggesellschaft "Lufthansa" aus.
*Tabelle: SPFLI, SCARR
*****************************************************************************************
SELECT
FROM
spfli AS allflights
LEFT OUTER JOIN scarr AS flightsname
ON allflights~carrid = flightsname~carrid
FIELDS
allflights~carrid,
allflights~connid,
flightsname~carrname,
allflights~countryfr,
allflights~cityfrom,
allflights~airpfrom,
allflights~countryto,
allflights~cityto,
allflights~airpto

WHERE allflights~carrid = 'LH' AND allflights~fltype <> 'X' "--> Zeig alles was Lufthansa ist und was ein Linienflug ist, die in der Tabelle wo X drinnen steht sind keine Linienflugzeuge
INTO TABLE @DATA(lt_join_lufthansa).

*cl_demo_output=>display( lt_join_lufthansa ).



*****************************************************************************************
*Extra: Linienflüge
*Aufgabenstellung Wählen Sie alle Linienflüge aus.
*Erweitern Sie Ihren Select Befehl so, dass der vollständige Name der Fluggesellschaft
*anstatt der ID der Airline angezeigt wird.
*Tabelle: SPFLI, SCARR
*****************************************************************************************
SELECT
FROM
spfli AS flightsall
LEFT OUTER JOIN scarr AS flugzeuge
ON flightsall~carrid = flugzeuge~carrid
FIELDS
flugzeuge~carrname,
flightsall~cityfrom,
flightsall~cityto
WHERE flightsall~fltype <> 'X' "Die X markierte Stellen in Tabelle sind keine Linienflugzeuge
INTO TABLE @DATA(lt_join_linienfluege).

*cl_demo_output=>display( lt_join_linienfluege ).

*****************************************************************************************
*Extra: Maximale Kapazität
*Aufgabenstellung: Finden Sie die maximale Kapazität jeder Fluggesellschaft.
*Tabelle: SCARR, SFLIGHT
*****************************************************************************************
SELECT
FROM
scarr AS fliegernamen
LEFT OUTER JOIN sflight AS flugdaten
ON fliegernamen~carrid = flugdaten~carrid
FIELDS
fliegernamen~carrname AS Flugzeug_Name,
SUM( flugdaten~seatsmax ) AS Economy_Sitze,
SUM( flugdaten~seatsmax_b ) AS Business_Sitze,
SUM( flugdaten~seatsmax_f ) AS Firstclass_Sitze,
SUM( flugdaten~seatsmax + flugdaten~seatsmax_b + flugdaten~seatsmax_f ) AS TotalSum
GROUP BY fliegernamen~carrname "Das bedeutet, dass er es nach Namen sortiert, da kann man nicht nach Aggregationswerten sortieren sondern nach normalen feld wie name bei uns
INTO TABLE @DATA(lt_join_maxkapazitat).

 cl_demo_output=>display( lt_join_maxkapazitat ).
