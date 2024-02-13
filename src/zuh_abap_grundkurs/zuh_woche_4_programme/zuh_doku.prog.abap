*&---------------------------------------------------------------------*
*& Report zuh_doku
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_doku.

*Geben sie die Namen alle´r Materialen aus, die Dokopflichtig sind
*Tabelle Mara, Marc

SELECT
 FROM mara
 LEFT JOIN mbew
 ON mara~matnr = mbew~matnr
 LEFT JOIN makt
 ON mara~matnr = makt~matnr
 LEFT JOIN marc
 ON mara~matnr = marc~matnr
 FIELDS
 mara~matnr AS Materialnr,
 makt~maktx AS Kurztext,
 mbew~stprs AS Standardpreis,
 marc~kzdkz
 WHERE marc~kzdkz = 'X'

 INTO TABLE @DATA(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).
