*&---------------------------------------------------------------------*
*& Report zob_sql_select_join_dw
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_sql_select_join_dw.

"Beispiel Aufbau eines Joins
*SELECT
*  scarr~carrid,
*  scarr~carrname,
*  spfli~connid
*  FROM Scarr
*  LEFT OUTER JOIN spfli ON scarr~carrid = spfli~carrid
*  INTO TABLE @DATA(lt)
*  ORDER BY scarr~carrid.
*cl_demo_output=>display( lt ).

**********************************************************************
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

**********************************************************************
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

**********************************************************************
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
*    AND fltype = @abap_false "X = Charter '' = Linie
*  INTO TABLE @DATA(lt_flugplan).
*
*cl_demo_output=>display( lt_flugplan ).

**********************************************************************
"Extra: Linienflüge
"Wählen Sie alle Linienflüge aus. Erweitern Sie Ihren Select Befehl so, dass der vollständige Name der Fluggesellschaft anstatt der ID der Airline angezeigt wird. Tabelle: SPFLI, SCARR

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

**********************************************************************
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

**********************************************************************
"Extra extra

"Geben Sie die Anzahl der Lieferanten pro Land aus.
"Tabelle: LFA1
*SELECT
*  FROM lfa1
*  FIELDS
*    count( * ) AS anzahl,
*    LAND1
*  GROUP BY land1
*  INTO TABLE @DATA(lt_lieferanten_pro_land).

*cl_demo_output=>display( lt_lieferanten_pro_land ).

"Geben Sie die Namen aller Ihrer Deutschen Lieferanten aus.
"Tabelle: LFA1

*SELECT
*  FROM lfa1
*  FIELDS
*    name1
*  WHERE land1 = 'DE'
*  INTO TABLE @DATA(lt_de_lieferanten).
*
*cl_demo_output=>display( lt_de_lieferanten ).

"Geben Sie zusätzlich den Gruppennamen aus.
"Tabellen: LFA1, T077Y~TXT30
*SELECT
*  FROM lfa1
*  LEFT OUTER JOIN T077Y ON lfa1~KTOKK = T077Y~ktokk AND T077Y~spras = @sy-langu
*  FIELDS
*    lfa1~name1,
*    T077Y~txt30
*  WHERE land1 = 'DE'
*  INTO TABLE @DATA(lt_de_lieferanten_mit_extra).
*
*cl_demo_output=>display( lt_de_lieferanten_mit_extra ).
*
*
"Gebt alle Materialien mit ihren Kurztexten aus.
"Tabellen: MARA, MAKT
*SELECT
*  FROM MARA
*  LEFT JOIN MAKT ON mara~MATNR = makt~matnr
*  FIELDS
*    mara~matnr,
*    makt~maktx
*  INTO TABLE @DATA(lt_materialien)
*  UP TO 100 ROWS.
*
*  cl_demo_output=>display( lt_materialien ).


*
"Geben Sie zusätzlich den Standardpreis der Materialien aus.
"Tabellen: MARA, MBEW, MAKT
*SELECT
*  FROM MARA
*  LEFT JOIN MAKT ON mara~MATNR = makt~matnr
*  LEFT JOIN MBEW ON mara~matnr = mbew~matnr
*  FIELDS
*    mara~matnr,
*    makt~maktx,
**    makt~spras,
*    mbew~stprs
*
*  INTO TABLE @DATA(lt_materialien)
*  UP TO 100 ROWS.
*
*  cl_demo_output=>display( lt_materialien ).



"Geben Sie die Namen aller Materialien aus, die Doku pflichtig sind.
"Tabelle: MARA, MARC
*
"Ermitteln Sie pro Material die Lageorte und die Mengen der 'frei verwendtbaren' Materialien.
"Tabellen: MARA, MARD
*
"Geben Sie Materialiennamen mit Ihren Komponenten aus.
"Ermitteln Sie hierfür die Stücklisten der Materialien (MAST).
"Selektieren Sie daraufhin die Positionen der Stückliste (STPO).
"Tabellen: MARA, MAKT, MAST, STPO
