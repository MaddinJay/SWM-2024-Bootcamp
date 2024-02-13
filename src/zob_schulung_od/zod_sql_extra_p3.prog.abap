*&---------------------------------------------------------------------*
*& Report zod_sql_extra_p3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_sql_extra_p3.

*"Gebt alle Materialien mit ihren Kurztexten aus.
*"Tabellen: MARA, MAKT
***********************************************************************
*SELECT
*FROM mara LEFT JOIN MAKT ON makt~matnr = mara~matnr
*FIELDS
*mara~matnr as matrialnummer,
*makt~MAKTX as kurztextx,
*makt~MAKTG as KURZTEXTG
*INTO TABLE @DATA(lt_materialen).
*cl_demo_output=>display( lt_materialen ).

***********************************************************************
*Geben Sie zusätzlich den Standardpreis der Materialien aus.
*Tabellen: MARA, MBEW, MAKT
*
***********************************************************************
SELECT
FROM mara
LEFT JOIN MAKT ON makt~matnr = mara~matnr
LEFT JOIN MBEW ON makt~matnr = MBEW~matnr
FIELDS
mara~matnr as matrialnummer,
makt~MAKTX as kurztextx,
makt~MAKTG as KURZTEXTG,
MBEW~STPRS as Standartpreis
INTO TABLE @DATA(lt_materialen).
cl_demo_output=>display( lt_materialen ).











***********************************************************************
*Ermitteln Sie pro Material die Lageorte und die Mengen der 'frei verwendtbaren' Materialien.
*Tabellen: MARA, MARD
***********************************************************************
***********************************************************************
*SELECT
*FROM mara LEFT JOIN mard ON mard~matnr = mara~matnr
*FIELDS
*mara~matnr AS Materialnummer,
*mard~lgort AS lagerort,
*mard~labst AS frei_verwendbar
*WHERE mard~labst >= 1
*GROUP BY mara~matnr,mard~lgort,mard~labst
*ORDER BY mard~labst DESCENDING
*INTO TABLE @DATA(lt_menge).
*cl_demo_output=>display( lt_menge ).

***********************************************************************
*"Geben Sie Materialiennamen mit Ihren Komponenten aus.
*"Ermitteln Sie hierfür die Stücklisten der Materialien (MAST).
*"Selektieren Sie daraufhin die Positionen der Stückliste (STPO).
*"Tabellen: MARA, MAKT, MAST, STPO
***********************************************************************
