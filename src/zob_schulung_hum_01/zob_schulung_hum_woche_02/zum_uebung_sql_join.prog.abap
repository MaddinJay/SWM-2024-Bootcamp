*&---------------------------------------------------------------------*
*& Report zum_uebung_sql_join
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zum_uebung_sql_join.

**ÜBUNG JOIN
**Wählen Sie die Spalten für Airline-Code, Flugverbindungsnummer, Flugdatum, Kundenname und Sprache aus.
**Geben Sie maximal 20 Einträge aus.
**Tabellen SBOOK und SCUSTOM
*
**CARRID, CONNID, FLDATE, PASSNAME und NAME, LANGU
*
**SELECT
**FROM
**SBOOK AS booking
**INNER JOIN
**SCustom as customer
**on customer~id = booking~customid
**FIELDS
**booking~CARRID,
**booking~connid,
**booking~FLDATE,
**customer~name,
**customer~LANGU
**INTO TABLE @DATA(lt_passagiere)
**UP to 20 rows.
**cl_demo_output=>display(
**  data = lt_passagiere ).
*
**EXTRA: Flüge und Fluggesellschaften
**verwenden Sie einen Join, um die Details aller Flüge und deren entsprechenden Fluggesellschaften aus den Tabellen SFLIGHT und SCARR zu holen
*
*SELECT
*FROM
*SCarr AS carrier
*LEFT OUTER JOIN
*sflight AS flier
*ON carrier~carrid = flier~carrid
*FIELDS
*carrier~carrid AS Airlinecode, "as bennent um und macht Namen sprechender
*carrier~carrname,
*flier~fldate,
*flier~planetype,
*carrier~currcode
*INTO TABLE @DATA(lt_flugdaten).
*cl_demo_output=>display(
*  data = lt_flugdaten ).

*EXTRA: Lufthansa Flüge
*Wählen Sie alle Linienflüge der Fluggesellschaft "Lufthansa" aus.
*Tabelle SPFLI, SCARR

*SELECT
*FROM
*scarr AS carrier
*LEFT OUTER JOIN
*spfli AS flyinfo
*ON carrier~carrid = flyinfo~carrid
*FIELDS
*carrier~carrid,
*carrier~carrname,
*flyinfo~airpfrom,
*flyinfo~airpto,
*flyinfo~deptime,
*flyinfo~arrtime,
*flyinfo~fltype
*WHERE carrier~carrid ='LH'
*AND flyinfo~fltype =' '
*INTO TABLE @DATA(lt_fluginfo).
*cl_demo_output=>display(
*  data = lt_fluginfo ).

*EXTRA: Linienflüge
*Wählen Sie alle Linienflüge aus. Erweitern Sie Ihren Select-Befehlt so,
*dass der vollständige Name der Fluggesellschaft anstatt der ID der Airline angezeigt wird.
*Tabelle: SPFLI, SCARR

*SELECT
*FROM
*scarr AS carrier1
*LEFT OUTER JOIN
*spfli AS flyinfo1
*ON carrier1~carrid = flyinfo1~carrid
*FIELDS
*carrier1~carrname AS Name_Airline,
*flyinfo1~connid AS Flugnummer,
*flyinfo1~cityfrom AS Abflughafen,
*flyinfo1~cityto AS Zielflughafen,
*flyinfo1~deptime AS Abflugzeit,
*flyinfo1~arrtime AS Ankunftszeit,
*flyinfo1~fltime AS Flugzeit
*WHERE flyinfo1~fltype = ' '
*INTO TABLE @DATA(lt_fluginfo1).
*cl_demo_output=>display(
*  data = lt_fluginfo1 ).

*SELECT "Alternative
*FROM
*spfli AS flyinfo2
*LEFT OUTER JOIN
*scarr AS carrier2
*ON carrier2~carrid = flyinfo2~carrid
*FIELDS
*carrier2~carrname AS Name_Airline,
*flyinfo2~connid AS Flugnummer,
*flyinfo2~cityfrom AS Abflughafen,
*flyinfo2~cityto AS Zielflughafen,
*flyinfo2~deptime AS Abflugzeit,
*flyinfo2~arrtime AS Ankunftszeit,
*flyinfo2~fltime AS Flugzeit
*WHERE flyinfo2~fltype = ' '
*INTO TABLE @DATA(lt_fluginfo2).
*cl_demo_output=>display(
*  data = lt_fluginfo2 ).

*EXTRA: Maximale Kapazität
*Finden Sie die maximale Kapazität jeder Fluggesellschaft.
*Tabelle: SCARR, SFLIGHT

*SELECT
*FROM
*scarr AS carrier3
*RIGHT OUTER JOIN
*sflight AS flier2
*ON carrier3~carrid = flier2~carrid
*FIELDS
*flier2~fldate AS Flugdatum,
*carrier3~carrname AS Name_Airline,
*flier2~connid AS Flugnummer,
*flier2~seatsmax AS max_Eco,
*flier2~seatsmax_b AS max_Business,
*flier2~seatsmax_f AS max_First,
*SUM( flier2~seatsmax + flier2~seatsmax_b + flier2~seatsmax_f ) AS max_Kapazitaet
*GROUP BY carrier3~carrname, flier2~connid, flier2~fldate, flier2~seatsmax, flier2~seatsmax_b, flier2~seatsmax_f
*ORDER BY flier2~fldate
*INTO TABLE @DATA(lt_fluginfo3).
*cl_demo_output=>display(
*  data = lt_fluginfo3 ).

*EXTRA: Geben Sie die ANzahl der Lieferanten po Land aus
*Tabelle LFA1

*SELECT
*FROM lfa1
*FIELDS
*COUNT( * ) AS Anzahl_Lieferanten,
*land1 AS Land
*GROUP BY Land1
*INTO TABLE @DATA(lt_anzahl_lieferanten).
*Cl_demo_output=>display(
*  data = lt_anzahl_lieferanten ).
*
**GEBEN Sie die Namen aller deutschen Lieferanten aus
**Tabelle LFA1
*
*SELECT
*FROM lfa1
*FIELDS
*name1
*WHERE land1 = 'DE'
*INTO TABLE @DATA(lt_de_lieferanten).
*Cl_demo_output=>display(
*  data = lt_de_lieferanten ).
*
**Geben Sie zusätzlich den Gruppennamen aus.
**Tabellen LFA1, T077Y-TXT30
*
*SELECT
*FROM lfa1
*LEFT OUTER JOIN t077y
*ON lfa1~ktokk = t077y~ktokk AND t077y~spras = @sy-langu
*FIELDS
*lfa1~name1,
*t077Y~txt30
*WHERE land1 = 'DE'
*INTO TABLE @DATA(lt_de_lieferanten1).
*Cl_demo_output=>display(
*  data = lt_de_lieferanten1 ).

*Gebt alle Materialien mit ihren Kurztexten aus.
*Tabellen: MARA, MAKT
*Geben Sie zusätzlich den Standardpreis der Materialien aus.
*Tabellen: MARA, MBEW
*Geben Sie die Namen aller Materialien aus, die DOKU-pflichtig sind.
*Tabellen: MARA, MARC

*SELECT
*FROM mara
*LEFT OUTER JOIN makt
*ON Mara~matnr = makt~matnr AND makt~spras = @sy-langu
*LEFT OUTER JOIN mbew
*ON Mara~matnr = mbew~matnr
*LEFT OUTER JOIN marc
*ON mara~matnr = marc~matnr
*FIELDS
*mara~matnr AS Materialnummer,
*makt~maktx AS Materialtext,
*mbew~stprs AS Standardpreis,
*marc~kzdkz AS Dokumentationspflichtig
*WHERE marc~kzdkz = 'X'
*INTO TABLE @DATA(lt_materialnummer).
*cl_demo_output=>display(
*  data = lt_materialnummer ).
*
**ERmitteln Sie pro Material die Lagerorte und die Mengen der 'frei verwendbaren'
** Tabellen MARA, MARD
*
*SELECT
*FROM mara
*LEFT OUTER JOIN mard
*ON mara~matnr = mard~matnr
*FIELDS
*mara~matnr AS Materialnummer,
*mard~lgort AS Lagerort,
*mard~labst AS frei_verwendbar
*INTO TABLE @DATA(lt_verwendbar).
*cl_demo_output=>display(
*  data = lt_verwendbar ).

*Geben Sie die Materialiennamen mit ihren Komponenten aus.
*Ermitteln Sie hierfür die Stücklisten der Materialien ( MAST ).
*Selektieren Sie daraufhin die Positionen der Stückliste ( STPO ).
*Tabellen: MARA, MAKT, MAST, STPO

SELECT
FROM MAST
left OUTER join mara
on mast~matnr = mara~matnr
Left outer join makt
on mast~matnr = makt~matnr and makt~spras = @sy-langu
left outer join stpo
on mast~stlnr = stpo~stlnr
FIELDS
mara~matnr as Materialnummer,
makt~maktx as Materialtext,
mast~stlnr as Stuecklisten,
stpo~postp as Positionstyp,
stpo~posnr as Positionsnummer
into table @data(lt_positionen).
cl_demo_output=>display( lt_positionen ).
