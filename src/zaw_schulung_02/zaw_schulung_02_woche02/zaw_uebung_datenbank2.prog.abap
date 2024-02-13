*&---------------------------------------------------------------------*
*& Report zaw_uebung_datenbank2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_datenbank2.

" Geben Sie die Anzahl der Lieferanten pro Land aus. Tabelle LFA1

SELECT
FROM lfa1
FIELDS
COUNT( * ) AS Anzahl,
land1
GROUP BY land1
INTO TABLE @DATA(lt_lieferanten).

cl_demo_output=>display( lt_lieferanten ).


" Geben Sie die Namen aller deutschen Lieferanten aus. Tabelle LFA1

SELECT
FROM lfa1
FIELDS
name1 as Lieferantenname
WHERE land1 = 'DE'
INTO TABLE @DATA(lt_lieferantende).

cl_demo_output=>display( lt_lieferantende ).


" Geben Sie zusätzlich die Gruppennamen aus. Tabelle LFA1, T077Y~TXT30

SELECT
FROM lfa1
LEFT JOIN t077y
ON lfa1~ktokk = t077y~ktokk AND t077y~spras = @sy-langu
FIELDS
lfa1~name1,
T077y~txt30
WHERE land1 = 'DE'
INTO TABLE @DATA(lt_lieferantextra).

cl_demo_output=>display( lt_lieferantextra ).


" Geben Sie alle Materialien mit ihren Kurztexten aus. Tabellen: MARA, MAKT

SELECT mara~matnr as Materialnummer, makt~maktx as Kurztext
FROM mara
LEFT JOIN makt
ON mara~matnr = makt~matnr AND makt~spras = @sy-langu
INTO TABLE @DATA(lt_material).

cl_demo_output=>display( lt_material ).


" Geben Sie zusätzlich den Standardpreis der Materialen aus. Tabellen: MARA, MBEW

SELECT mara~matnr AS Materialnummer, makt~maktx AS Kurztext, mbew~stprs AS Standardpreis
FROM mara
LEFT JOIN makt
ON mara~matnr = makt~matnr AND makt~spras = @sy-langu
LEFT JOIN mbew
ON mara~matnr = mbew~matnr
WHERE mbew~stprs <> '0.0'
INTO TABLE @DATA(lt_preis).

cl_demo_output=>display( lt_preis ).


" Geben Sie die Namen aller Materialien aus, die Dokupflichtig sind, Tabellen: MARA, MARC

SELECT mara~matnr AS Materialnummer, makt~maktx AS Kurztext, marc~kzdkz AS Doku
FROM mara
LEFT JOIN makt
ON mara~matnr = makt~matnr AND makt~spras = @sy-langu
LEFT JOIN marc
ON mara~matnr = marc~matnr
WHERE marc~kzdkz = 'X'
INTO TABLE @DATA(lt_doku).

cl_demo_output=>display( lt_doku ).


" Ermitteln Sie pro Material die Lagerorte und die Mengen der frei verwendbaren Materialien. Tabellen: MARA, MARD

SELECT mara~matnr AS Materialnummer, mard~lgort AS Lagerort, mard~labst AS frei
FROM mara
LEFT JOIN mard
ON mara~matnr = mard~matnr
WHERE mard~lgort <> ''
INTO TABLE @DATA(lt_verwendbar).

cl_demo_output=>display( lt_verwendbar ).


" Geben Sie die Materialiennamen mit ihren Komponenten aus. Ermitteln Sie hierfür die Stücklisten der Materialien ( MAST ). Selektieren Sie
" daraufhin die Positionen der Stückliste ( STPO ). Tabellen: MARA, MAKT, MAST, STPO

SELECT mara~matnr AS Materialnummer, makt~maktx AS Kurztext, stpo~idnrk AS Komponente, mast~stlnr AS Stueckliste
FROM mast
LEFT JOIN mara
on mara~matnr = mast~matnr
left join makt
ON mast~matnr = makt~matnr AND makt~spras = @sy-langu
left join stpo
ON mast~stlnr  = stpo~stlnr
into table @DATA(lt_liste).

cl_demo_output=>display( lt_liste ).
