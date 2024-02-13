*&---------------------------------------------------------------------*
*& Report ZAW_DATENBANKEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_datenbanken.

"1) Definition der Daten:
"In die interne Tabelle gt_spfli soll die Tabellenstruktur geholt werden.
"In die Datenstruktur gs_spfli soll der Inhalt von spfli geholt werden.
DATA: gt_spfli TYPE TABLE OF spfli,
      gs_spfli TYPE spfli.

"2) Befehl zum Selektieren der Daten
SELECT * FROM spfli INTO TABLE gt_spfli WHERE carrid = 'LH'.
  "Bei Single ist Tabelle nicht möglich, da ja nur ein Datensatz.
SELECT SINGLE * FROM spfli INTO gs_spfli WHERE carrid = 'LH'.

IF sy-subrc <> 0.
  WRITE 'Fehler!'.
  ELSE.
  "3) Datenausgabe:
  "Aus der Struktur gs_spfli in der internen Tabelle gt_spfli sollen bestimmte Werte
  "herausgeschrieben werden.
  LOOP AT gt_spfli INTO gs_spfli.
    WRITE: gs_spfli-carrid, gs_spfli-connid, gs_spfli-countryfr, /.
  ENDLOOP.
ENDIF.
