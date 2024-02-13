*&---------------------------------------------------------------------*
*& Report zbv_schulung_sql_join
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_schulung_sql_join.

SELECT
 FROM sbook AS booking
 INNER JOIN scustom AS customer
 ON customer~id = booking~customid
 FIELDS
 booking~carrid,
 booking~connid,
 booking~fldate,
 customer~name,
 customer~langu
INTO TABLE @DATA(lt_join_specific)
UP TO 20 ROWS.

*cl_demo_output=>display( lt_join_specific ).

"Extra Übung: Flüge und Fluggessellschaften
"Verwenden Sie einen Join, um die Details aller Flüge und deren  entsprechenden Fluggesellschaften aus den Tabellen SFLIGHT und SCARR zu holen.

SELECT
  FROM
  SFLIGHT
  LEFT OUTER JOIN SCARR
  ON SFLIGHT~carrid = scarr~carrid
  FIELDS
  sflight~carrid,
  sflight~connid,
  sflight~fldate,
  scarr~carrname
  INTO TABLE @DATA(lt_Fluege).

*cl_demo_output=>display( lt_fluege ).

"Extra Aufgabe: Lufthansa Flüge
"Wählen Sie alle Linienflüge der Fluggesellschaft "Lufthansa" aus. Tabelle: SPFLI, SCARR

SELECT
  FROM
  SPFLI
  LEFT OUTER JOIN scarr
  ON SPFLI~carrid = scarr~carrid
  FIELDS
  scarr~carrname,
  SPFLI~cityfrom,
  spfli~cityto
  WHERE scarr~carrid = 'LH'
  AND spfli~FLTYPE <> 'X'
  INTO TABLE @DATA(lt_ziel).

* cl_demo_output=>display( lt_ziel ).

"Extra: Linienflüge
"Wählen Sie alle Linienflüge aus. Erweitern Sie Ihren Select Befehl so, dass der vollständige Name der Fluggesellschaft anstatt der ID der Airline angezeigt wird.Tabelle: SPFLI, SCARR

SELECT
  FROM
  SPFLI
  LEFT OUTER JOIN SCARR
  ON SPFLI~carrid = scarr~carrid
  FIELDS
  scarr~carrname,
  spfli~cityfrom,
  spfli~cityto
  WHERE spfli~FLTYPE <> 'X'
  INTO TABLE @DATA(lt_lines).

*  cl_demo_output=>display( lt_lines ).

"Extra: Maximale Kapazität
"Finden Sie die maximale Kapazität jeder Fluggesellschaft. Geben Sie den Namen der Fluggesellschaft mit aus. Tabelle: SCARR, SFLIGHT

SELECT
  FROM
  SCARR
  LEFT OUTER JOIN SFLIGHT
  ON SFLIGHT~carrid = scarr~carrid
  FIELDS
  scarr~carrname AS Fluggesellschaft,
  SUM( sflight~seatsmax ) AS Sitze_Economy_Max,
  SUM( sflight~SEATSMAX_B ) AS Sitze_Business_Max,
  SUM( sflight~SEATSMAX_F ) AS Sitze_First_Class_Max,
  SUM( sflight~seatsmax + sflight~seatsmax_b + sflight~seatsmax_F ) AS TotalSum
  GROUP BY scarr~carrname "Fasst mehrere Namen in eine Zeile und die Summen ebenfalls
  INTO TABLE @DATA(lt_seats).

*cl_demo_output=>display( lt_seats ).

"Extra extra
"Geben Sie die Anzahl der Liefernatnet pro Land aus.
"Tabelle: LFA1

SELECT
  FROM lfa1
  FIELDS
    COUNT( * ) AS anzahl,
    Land1
    GROUP by land1
    INTO TABLE @DATA(lt_lieferanten_pro_land).

*cl_demo_output=>display( lt_lieferanten_pro_land ).

"Gbeen Sie die Namen aller Ihrer Deutschen Lieferanten aus.
"Tabelle: LFA1

SELECT
  FROM LFA1
  FIELDS
    name1
  WHERE land1 = 'DE'
  INTO TABLE @DATA(lt_de_lieferanten).

*cl_demo_output=>display( lt_de_lieferanten ).

"Geben Sie zusätzlich den Gruppennamen aus.
"Tabellen: LFA1, T077K~TXT30

SELECT
  FROM LFA1
  LEFT OUTER JOIN T077Y ON lfa1~KTOKK = T077Y~ktokk AND T077Y~SPRAS = @sy-langu
  FIELDS
    lfa1~name1,
    t077Y~txt30
  WHERE land1 = 'DE'
  INTO TABLE @DATA(lt_lieferanten_mit_extra).

*cl_demo_output=>display( lt_lieferanten_mit_extra ).

"Aufgabe Extra Extra Extra
"Gebt alle Materialien mit ihren Lang- und Kurztexten aus.
"Tabellen: Mara, Makt

SELECT
  FROM MARA
  LEFT OUTER JOIN MAKT
  ON mara~matnr = makt~matnr
  FIELDS
  mara~matnr,
  mara~mtart,
  makt~maktx,
  makt~maktg
  INTO TABLE @DATA(lt_material).

*cl_demo_output=>display( lt_material ).




"Aufgabe Extra Extra Extra Extra
"Geben Sie zusätzlich den Standardpreis der Materialien aus.
"Tabelle: Mara, Mbew, Makt

SELECT
  FROM MARA
  LEFT OUTER JOIN MAKT
  ON mara~matnr = makt~matnr
  LEFT OUTER JOIN mbew
  ON mara~matnr = mbew~matnr
  FIELDS
  mara~matnr,
  mara~mtart,
  makt~maktx,
  makt~maktg,
  mbew~STPRS
  INTO TABLE @DATA(lt_preis_mat).

*cl_demo_output=>display( lt_preis_mat ).

"Aufgabe Extra Extra Extra Extra Extra
"Geben Sie die Namen aller Materialien aus, die Doku pflichtig sind
"Tabellen: MARA, MARC

SELECT
  FROM MARA
  LEFT OUTER JOIN MARC
  ON mara~matnr = marc~matnr
  FIELDS
  mara~matnr,
  mara~mtart,
  marc~KZDKZ
  WHERE KZDKZ = 'X'
  INTO TABLE @DATA(lt_doku).

cl_demo_output=>display( lt_doku ).

""Extra Extra Extra Extra Extra Extra
"Ermitteln Sie pro Material die Lageorte und die Mengen der 'frei verwendbaern'
"Materialien.
"Tabellen: MARA, MARD

"Aufgabe Extra Extra Extra Extra Extra Extra Extra
"Geben Sie Materialnamen mit Ihren Komponenten aus. Ermitteln Sie hierfür die STücklisten der Materialien (MAST).
"Selektieren Sie daraufhin die Positionen der Stückliste ( STPO ).
"Tabellen: MARA, MAKT, MAST, STPO
