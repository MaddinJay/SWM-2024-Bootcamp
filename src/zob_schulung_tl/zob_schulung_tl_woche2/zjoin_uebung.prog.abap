*&---------------------------------------------------------------------*
*& Report zjoin_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zjoin_uebung.
*Aufgabenstellung:
*Wählen Sie die Spalten für Airline-Code, Flugverbindungsnummer, Flugdatum, Kundenname und Sprache aus.
*Geben Sie maximal 20 Einträge aus.
*Tabellen: SBOOK und SCUSTOM

SELECT
FROM
sbook AS booking
INNER JOIN scustom AS customer
ON customer~id = booking~customid
FIELDS
booking~carrid,
booking~connid,
booking~fldate,
customer~name,
customer~langu
INTO TABLE @DATA(lt_join_uebung)
UP TO 20 ROWS.

cl_demo_output=>display( lt_join_uebung ).
