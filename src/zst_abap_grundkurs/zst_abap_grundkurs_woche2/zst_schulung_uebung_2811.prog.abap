*&---------------------------------------------------------------------*
*& Report zst_schulung_uebung_2811
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_schulung_uebung_2811.

*"Geben Sie die ältesten 10 Flüge der Flug-Tabelle aus. Tabelle SFLIGHT.
*SELECT
*  FROM
*    sflight
*  FIELDS
*    *
*  ORDER BY fldate DESCENDING
*  INTO TABLE @DATA(lt_flights)
*  UP TO 10 ROWS.
*
*SELECT
*  *
*  FROM sflight
*  ORDER BY fldate DESCENDING
*  INTO TABLE @DATA(lt_flights2)
*  UP TO 10 ROWS.
*cl_demo_output=>display( lt_flights ).
*
*"Geben Sie alle Kunden mit einer 100-er id aus. Tabelle SCUSTOM.
*SELECT
*  FROM scustom
*  FIELDS
*    *
**  WHERE id >= 100 AND id < 200
*  WHERE id BETWEEN 100 AND 199
*  INTO TABLE @DATA(lt_mandant).
*
*cl_demo_output=>display( lt_mandant ).
*
*"Geben Sie die Namen aller Fluggesellschaften aus, dessen Währung nicht Dollar oder Euro ist. Tabelle: SCARR
*SELECT
*  FROM
*  scarr
*  FIELDS
*  *
*  WHERE currcode <> 'EUR' AND currcode <> 'USD'
** " WHERE currcode NOT LIKE 'EUR' AND currcode NOT LIKE 'USD'
*  INTO TABLE @DATA(lt_flugges).
*
*cl_demo_output=>display( lt_flugges ).

"Geben Sie die Namen alle Flugkunden aus, die eine Anrede besitzen. Tablle SCUSTOM.

"Geben Sie den Flug mit der Buchungsnummer 144 aus. Tabelle SBOOK

"Geben Sie alle Flüge, die innerhalb der USA fliegen, aus. Tabelle SPFLI.

"Geben Sie alle Flüge, die Vormittags losfliegen und die mehr als einen Tag dauern, aus. Tabelle SPFLI.

"Geben Sie die Buchungsummen der einzelnen Tage aus. Tabelle SFLIGHT.

"Geben Sie alle Flugkunden, deren Hausnummer 6 ist, aus. Tabelle SCUSTOM.

"Geben Sie die Anzahl der gebuchten Flüge eines Kunden aus. Tabelle SBOOK.

"Geben Sie die Anzahl der Lieferanten pro Land aus.
"Tabelle: LFA1
*SELECT
*  FROM lfa1
*  FIELDS
*    count( * ) AS anzahl,
*    LAND1
*  GROUP BY land1
*  INTO TABLE @DATA(lt_lieferanten_pro_land).
*
*cl_demo_output=>display( lt_lieferanten_pro_land ).

*Geben Sie die Namen aller Ihrer Deutschen Lieferanten aus.
*Tabelle: LFA1
*
*SELECT
*  FROM lfa1
*  FIELDS
*    name1
*  WHERE land1 = 'DE'
*  INTO TABLE @DATA(lt_de_lieferanten).
*
*cl_demo_output=>display( lt_de_lieferanten ).

**Geben Sie zusätzlich den Gruppennamen aus.
**Tabellen: LFA1, T077Y~TXT30
*SELECT
*  FROM lfa1
*  LEFT OUTER JOIN T077Y ON lfa1~KTOKK = T077Y~ktokk AND T077Y~spras = @sy-langu
*  FIELDS
*    lfa1~name1,
*    T077Y~txt30
*  WHERE land1 = 'DE'
*  INTO TABLE @DATA(lt_de_lieferanten_mit_extra).

*Gebt alle Materialien mit ihren Kurztexten aus.
*Tabellen: MARA, MAKT
*
*Select
*From
*Makt
*left outer join mara
*on makt~matnr = mara~matnr
*Fields
*makt~matnr,
*makt~maktg
*
*
*INTO TABLE @DATA(lt_material).
*
*cl_demo_output=>display( lt_material ).

*Geben Sie zusätzlich den Standardpreis der Materialien aus.
*Tabellen: MARA, MBEW, MAKT
*
*Select
*From
*Maka
*left join mark
*on maka~matnr = markt~matnr
*left join mbew
*on makt~matnr = mbew~matnr
*Fields
*makt~matnr as Materialnummer,
*makt~maktg as Langtext,
*mbew~stprs as Preis
*
*
*INTO TABLE @DATA(lt_material).
*
*cl_demo_output=>display( lt_material ).

*Geben Sie die Namen aller Materialien aus, die Doku pflichtig sind.
*Tabelle: MARA, MARC
*
*Select
*from
*Mara
*inner join marc
*on mara~matnr = marc~matnr
*fields
*mara~matnr as Materialnummer,
*marc~kzdkz as Dokupflichtig
*Where marc~kzdkz = 'X'
*
*INTO TABLE @DATA(lt_material).
*
*cl_demo_output=>display( lt_material ).

*
*Ermitteln Sie pro Material die Lageorte und die Mengen der 'frei verwendtbaren' Materialien.
*Tabellen: MARA, MARD
*Select
*from
*Mara
*inner join mard
*on mara~matnr = mard~matnr
*fields
*mara~matnr as Materialnummer,
*mard~lgort as Lagerrort,
*mard~vmlab as Frei
*
*INTO TABLE @DATA(lt_material).
*
*cl_demo_output=>display( lt_material ).


*
*Geben Sie Materialiennamen mit Ihren Komponenten aus.
*Ermitteln Sie hierfür die Stücklisten der Materialien (MAST).
*Selektieren Sie daraufhin die Positionen der Stückliste (STPO).
*Tabellen: MARA, MAKT, MAST, STPO

**********************************************************************

*SELECT
* FROM sbook AS booking
* INNER JOIN scustom AS customer
* ON customer~id = booking~customid
* FIELDS
* booking~carrid as AirlineCode,
* booking~connid as Verbindung,
* booking~fldate as Flugdatum,
* customer~name as Kundenname,
* customer~langu as Kundensprache
* INTO TABLE @DATA(lt_buchung)
* UP TO 20 ROWS.


*SELECT
* from sflight AS flug
*  LEFT JOIN scarr AS gesell
*on flug~carrid = gesell~carrid
* FIELDS
* gesell~*,
* flug~fldate
*
* INTO TABLE @DATA(lt_gesellsch).
*
*cl_demo_output=>display( lt_gesellsch ).

*SELECT
* from SPFLI AS flug
*  Inner JOIN scarr AS gesell
*on flug~carrid = gesell~carrid
* FIELDS
* gesell~carrname,
* flug~*
* Where flug~carrid = 'LH'
* and flug~fltype <> 'X'
*
* INTO TABLE @DATA(lt_gesellsch).
**
*cl_demo_output=>display( lt_gesellsch ).

*SELECT
* from SPFLI AS flug
*  cross JOIN scarr AS gesell
**on flug~carrid = gesell~carrid
* FIELDS
* gesell~carrname,
*   Flug~CARRID,
*   Flug~CONNID,
*   Flug~COUNTRYFR,
*   Flug~CITYFROM,
*   Flug~AIRPFROM,
*   Flug~COUNTRYTO,
*   Flug~CITYTO,
*   Flug~AIRPTO,
*   Flug~FLTIME,
*   Flug~DEPTIME,
*   Flug~ARRTIME,
*   Flug~DISTANCE,
*   Flug~DISTID,
*   Flug~FLTYPE,
*   Flug~PERIOD
*
* GROUP BY
* gesell~carrname,
* Flug~CARRID,
*   Flug~CONNID,
*   Flug~COUNTRYFR,
*   Flug~CITYFROM,
*   Flug~AIRPFROM,
*   Flug~COUNTRYTO,
*   Flug~CITYTO,
*   Flug~AIRPTO,
*   Flug~FLTIME,
*   Flug~DEPTIME,
*   Flug~ARRTIME,
*   Flug~DISTANCE,
*   Flug~DISTID,
*   Flug~FLTYPE,
*   Flug~PERIOD
*
* INTO TABLE @DATA(lt_gesellsch).
*
*cl_demo_output=>display( lt_gesellsch ).

*SELECT
* FROM scarr AS gesell
*  Left JOIN sflight AS flug
*ON flug~carrid = gesell~carrid
* FIELDS
* gesell~carrname,
*  SUM( seatsmax ) AS Max_Eco,
*  SUM( seatsmax_b ) AS Max_Busi,
*  SUM( seatsmax_f ) AS Max_First,
*  SUM( seatsmax + seatsmax_b + seatsmax_f ) AS Gesamt
*
* Group by gesell~carrname
*
* INTO TABLE @DATA(lt_gesellsch).
**
*cl_demo_output=>display( lt_gesellsch ).

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
