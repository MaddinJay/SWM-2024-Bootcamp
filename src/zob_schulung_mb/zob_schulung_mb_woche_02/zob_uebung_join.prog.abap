*&---------------------------------------------------------------------*
*& Report zob_uebung_join
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_join.

*Wählen Sie die Spalten für Airline-Code, Flugverbindungsnummer, Flugdatum,
*Kundenname und Sprache aus. Geben Sie maximal 20 Einträge aus.
*Tabellen: SBOOK und SCUSTOM

*SELECT
*
*sbook~carrid,     "Airline-Code
* sbook~connid,    "Flugverbindung
* sbook~fldate,    "Flugdatum
* scustom~name,    "Kundenname
* scustom~langu     "Sprache
*
* from sbook
*
* INNER JOIN scustom ON sbook~carrid = scustom~id
* AND sbook~connid = scustom~connid.

 SELECT
 FROM sbook AS buchung
 INNER JOIN scustom AS kunde
 ON kunde~id = buchung~customid  " ich verknüpfe mit Primärschlüssel
 FIELDS
 buchung~carrid AS AirlineCode,
 buchung~connid As Flugverbindung,
 buchung~fldate AS Flugdatum,
 kunde~name     As Kundenname,
 kunde~langu    AS Sprache
 INTO TABLE @DATA(lt_Flugdaten)
 UP TO 20 ROWS.

 Cl_demo_output=>display( lt_Flugdaten ).
