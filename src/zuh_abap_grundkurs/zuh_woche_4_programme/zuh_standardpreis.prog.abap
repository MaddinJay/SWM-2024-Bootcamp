*&---------------------------------------------------------------------*
*& Report zuh_standardpreis
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_standardpreis.

* Geben sie zusätzlich daen Standardpreis der Materialien aus
* Bitte nur die Deutschen Datensätze
*Tabelle: Mara, MBEW, Makt

SELECT
 FROM mara
 LEFT JOIN mbew
 ON mara~matnr = mbew~matnr
 LEFT JOIN makt
 ON mara~matnr = makt~matnr
 FIELDS
 mara~matnr AS Materialnr,
 makt~maktx AS Kurztext,
 makt~spras AS Sprache,
 mbew~stprs AS Standardpreis
WHERE makt~spras = 'D'
 INTO TABLE @DATA(lt_tabelle)
UP TO 100 ROWS.

cl_demo_output=>display( lt_tabelle ).
