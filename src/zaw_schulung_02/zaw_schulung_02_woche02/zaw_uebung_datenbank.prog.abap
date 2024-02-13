*&---------------------------------------------------------------------*
*& Report zaw_uebung_datenbank
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_datenbank.


*" Wählen Sie die Spalten für Airline-Code, Flugverbindungsnummer, Flugdatum, Kundenname und Sprache aus. Geben Sie maximal 20 Einträge aus.
*" Tabellen: SBOOK und SCUSTOM
*
*SELECT b~carrid, b~connid, b~fldate, c~name, c~langu  " Spalten, die ausgelesen werden sollen - mit Zuordnung zum entsprechenden Alias
*FROM sbook AS b                                       " Alias für linke Tabelle
*LEFT JOIN scustom AS c                          " Alias für rechte Tabelle
*ON b~customid = c~id
*INTO TABLE @DATA(lt_join)
*UP TO 20 ROWS.
*
*cl_demo_output=>display( lt_join ).
*
*
*" Verwenden Sie einen Join, um einige Details aller Flüge und deren entsprechenden Fluggesellschaften aus den Tabellen SFLIGHT und SCARR zu holen.
*
*SELECT sc~carrid, sc~carrname, fl~fldate, fl~price, fl~planetype
*FROM sflight AS fl
*LEFT JOIN scarr AS sc
*ON fl~carrid = sc~carrid
*INTO TABLE @DATA(lt_flight).
*
*cl_demo_output=>display( lt_flight ).
*
*
*" Wählen Sie alle Linienflüge der Fluggesellschaft "Lufthansa" aus. Tabelle: SPFLI, SCARR
*
*SELECT
*sp~carrid AS id,
*sp~connid AS Code,
*sp~countryfr AS DepLand,
*sp~cityfrom AS DepStadt,
*sp~airpfrom AS DepFH,
*sp~countryto AS ArrLand,
*sp~cityto AS ArrStadt,
*sp~airpto AS ArrFH,
*sc~currcode AS Waehrung
*FROM spfli AS sp
*LEFT JOIN scarr AS sc
*ON sp~carrid = sc~carrid
*WHERE sp~carrid = 'LH'
*INTO TABLE @DATA(lt_linie).
*
*cl_demo_output=>display( lt_linie ).
*
*
*" Wählen Sie alle Linienflüge aus. Erweitern Sie Ihren Select Befehl so, dass der vollständige Name der Fluggesellschaft anstatt der ID der Airline angezeigt wird.
*" Tabelle: SPFLI, SCARR
*
*SELECT
*sc~carrname AS Name,
*sp~connid AS Code,
*sp~countryfr AS DepLand,
*sp~cityfrom AS DepStadt,
*sp~airpfrom AS DepFH,
*sp~countryto AS ArrLand,
*sp~cityto AS ArrStadt,
*sp~airpto AS ArrFH
*FROM spfli AS sp
*RIGHT JOIN scarr AS sc
*ON sp~carrid = sc~carrid
*WHERE sp~fltype <> 'x'
*INTO TABLE @DATA(lt_line).
*
*cl_demo_output=>display( lt_line ).
*
*
*" Finden Sie die maximale Kapazität jeder Fluggesellschaft. Geben Sie den Namen der Fluggesellschaft mit aus. Tabelle: SCARR, SFLIGHT
*
*SELECT
*FROM sflight AS fl
*LEFT JOIN scarr AS sc
*ON fl~carrid = sc~carrid
*FIELDS
*sc~carrname AS Fluggesellschaft,
*    SUM( seatsmax ) AS max_economy,
*      SUM( seatsmax_b ) AS max_business,
*       SUM( seatsmax_f ) AS max_first,
*       SUM( seatsmax + seatsmax_b + seatsmax_f ) AS max_insgesamt
*       GROUP BY sc~carrname
*INTO TABLE @DATA(lt_kapazi).
*
*cl_demo_output=>display( lt_kapazi ).


" Fügen Sie dem Datensatz einen neuen Flughafen hinzu. Tabelle: SAIRPORT

INSERT INTO sairport VALUES @( VALUE
#( id = 'LMO'
name = 'Lomé Eyadema, Togo'
Time_zone = 'UTC' )
).

UPDATE sairport
SET name = 'Lomé Gnassignbe, Togo'
WHERE id = 'LMO'.

DELETE
FROM sairport
WHERE id = 'LMO'.

IF sy-subrc = 0.
  WRITE 'Eintrag wurde geändert.'.
ENDIF.
