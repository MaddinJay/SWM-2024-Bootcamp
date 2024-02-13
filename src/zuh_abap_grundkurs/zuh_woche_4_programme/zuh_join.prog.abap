*&---------------------------------------------------------------------*
*& Report zuh_join
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_join.

*Wählen Sie die Spalten für Airline-Code, Flugverbindungsnummer, Flugdatum,
*Kundenname und Sprache aus. Geben Sie maximal 20 Einträge aus.
*Tabellen: SBOOK und SCUSTOM


SELECT
 FROM sbook AS booking
 INNER JOIN scustom AS customer
 ON customer~id = booking~customid
 FIELDS
 booking~carrid AS Airline_code,
 booking~connid AS Flugnummer,
 booking~fldate AS Flugdatum,
 customer~name AS Fluggast,
 customer~langu AS Sprache
 INTO TABLE @DATA(lt_join_tabelle)
 UP TO 20 ROWS.


cl_demo_output=>display( lt_join_tabelle ).


*SELECT
* FROM sbook
* INNER JOIN scustom
* ON scustom~id = sbook~customid
* FIELDS
* sbook~carrid,
* sbook~connid,
* sbook~fldate,
* scustom~name,
* scustom~langu
* INTO TABLE @DATA(lt_join_tabelle)
* UP TO 20 ROWS.
*
*
*cl_demo_output=>display( lt_join_tabelle ).
