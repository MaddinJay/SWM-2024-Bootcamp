*&---------------------------------------------------------------------*
*& Report zuh_lagerort
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_lagerort.

*Ermitteln sie pro Material die Lagerorte und die Menge der frei verwendtbarenen materialen
*Tabelle Mara, MARD

SELECT
 FROM mara
 LEFT JOIN mbew
 ON mara~matnr = mbew~matnr
 LEFT JOIN makt
 ON mara~matnr = makt~matnr
 LEFT JOIN marc
 ON mara~matnr = marc~matnr
 LEFT JOIN mard
 ON mara~matnr = mard~matnr
 FIELDS
 mara~matnr AS Materialnr,
 makt~maktx AS Kurztext,
 mbew~stprs AS Standardpreis,
 marc~kzdkz AS Doku_Pflicht,
 mard~lgpbe AS Lagerort,
 mard~labst AS frei_verfuegbar

* WHERE marc~kzdkz = 'X'


 INTO TABLE @DATA(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).
