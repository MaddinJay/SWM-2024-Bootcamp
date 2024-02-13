*&---------------------------------------------------------------------*
*& Report zextra_aufgaben_denise_joins
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zextra_aufgaben_denise_joins.
**************************************************************************
*Geben Sie die Anzahl der Lieferanten pro Land aus.
*Tabelle: LFA1
SELECT
FROM
lfa1
FIELDS
COUNT( * ) AS Anzahl,
LAND1
GROUP BY LAND1
INTO TABLE @DATA(lt_lieferanten).

*cl_demo_output=>display( lt_lieferanten ).

**************************************************************************
*Geben Sie die Namen aller Ihrer Deutschen Lieferanten aus.
*Tabelle: LFA1
SELECT
FROM
lfa1
FIELDS
name1
WHERE land1 = 'DE'
INTO TABLE @DATA(lt_de_lieferanten).
*cl_demo_output=>display( lt_de_lieferanten ).

**************************************************************************
*Geben Sie zusätzlich den Gruppennamen aus.
*Tabellen: LFA1, T077Y~TXT30
SELECT
  FROM
  lfa1
  LEFT OUTER JOIN T077Y ON lfa1~KTOKK = T077Y~ktokk AND T077Y~spras = @sy-langu
  FIELDS
    lfa1~name1,
    T077Y~txt30
  WHERE land1 = 'DE'
INTO TABLE @DATA(lt_de_lieferanten_extra).
*cl_demo_output=>display( lt_de_lieferanten_extra ).

**************************************************************************
*Gebt alle Materialien mit ihren Kurztexten aus.
*Tabellen: MARA, MAKT
SELECT
FROM
mara
LEFT OUTER JOIN makt ON mara~matnr = makt~matnr
FIELDS
mara~matnr AS Materialnr,
mara~mtart AS Materialart,
makt~maktx AS Materialkurzel,
makt~maktg AS Materialkurzel_gross
INTO TABLE @DATA(lt_materialien).
cl_demo_output=>display( lt_materialien ).

**************************************************************************
*Geben Sie zusätzlich den Standardpreis der Materialien aus.
*Tabellen: MARA, MBEW, MAKT
SELECT
FROM
mara
LEFT OUTER JOIN mbew ON mara~matnr = mbew~matnr
LEFT OUTER JOIN makt ON mara~matnr = makt~matnr
FIELDS
mara~matnr AS Materialnr,
mara~mtart AS Materialart,
makt~maktx AS Materialkurzel,
mbew~stprs AS Standardpreis
INTO TABLE @DATA(lt_materialien_preis).
cl_demo_output=>display( lt_materialien_preis ).
