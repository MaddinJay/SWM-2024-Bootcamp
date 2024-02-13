*&---------------------------------------------------------------------*
*& Report zuh_lieferanten
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_lieferanten.

* Geben Sie die Anzahl der Lieferanten pro Land us.
* Tabelle: LFA1

SELECT FROM lfa1
FIELDS COUNT( * ) AS anzahl,
land1
GROUP BY land1

 INTO TABLE @DATA(lt_join_tabelle).


cl_demo_output=>display( lt_join_tabelle ).
