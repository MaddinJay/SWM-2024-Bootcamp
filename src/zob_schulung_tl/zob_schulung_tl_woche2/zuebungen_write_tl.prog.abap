*&---------------------------------------------------------------------*
*& Report zuebungen_write_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuebungen_write_tl.
****************************************************************************
*INSERT
*Aufgabe: Fügen Sie einen Eintrag in die SCUSTOM Tabelle ein.
*Tabelle: SCUSTOM
****************************************************************************
DATA(ls_insert) = VALUE scustom(
id = 100234
name = 'Tea'
form = 'Frau'
street = 'Emmy_Noether_St 2'
postbox = 'B 33'
postcode = '80992'
city = 'Munich'
country = 'Deutschland'
region = 'BA'
telephone = '01358416874'
).
*INSERT scustom FROM ls_insert.
*IF sy-subrc = 0.
*  WRITE 'Insert Aufgabe - Du hast erfolgreich Daten hinzugefügt'.
*ELSE.
*  WRITE 'Insert Aufgabe - Daten wurden nicht hinzugefügt'.
*ENDIF.

"Variante 2, damit ich DELETE testen kann
*INSERT INTO scustom VALUES @( VALUE
*#(
*id = 5553335
*name = 'Tea'
*form = 'Frau'
*street = 'Whatever Street 45'
*postbox = 'A56'
*postcode = '80538'
*city = 'Munich'
*country = 'Deutschland'
*region = 'BA'
*telephone = '5494430091'
*) ).
*IF sy-subrc = 0.
*  WRITE 'Insert Data2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Insert Data2 - Das hat nicht geklappt.'.
*ENDIF.




****************************************************************************
*UPDATE
*Aufgabe: Ändern Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
*Tabelle: SCUSTOM
****************************************************************************
*ls_insert-name = 'Tea Lukač'.
*UPDATE scustom FROM ls_insert.
*IF sy-subrc = 0.
*WRITE 'Update Aufgabe - Alles hat geklappt'.
*ELSE.
*WRITE 'Update Aufgabe - Das hat nicht geklappt'.
*ENDIF.

"Option 2 --> Damit Daten nicht verloren gehen rufen wir unsere Struktur mit SELECT ab:
SELECT SINGLE
  FROM
  scustom
  FIELDS
  *
  WHERE id = 100234
  INTO @ls_insert.
  ls_insert-city = 'Derventa'.
  ls_insert-country = 'BIH'.
UPDATE scustom FROM ls_insert.
IF sy-subrc = 0.
  WRITE 'Update Option 2 Übung - Alles hat funktioniert!'.
ELSE.
  WRITE 'Update Option 2 Übung - Das hat nicht geklappt.'.
ENDIF.

****************************************************************************
*DELETE
*Aufgabe: Löschen Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
*Tabelle: SCUSTOM
****************************************************************************
*DELETE FROM SCUSTOM WHERE id = 5553335.
*IF sy-subrc = 0.
*  WRITE 'Delete Data2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Data2 - Das hat nicht geklappt.'.
*ENDIF.

****************************************************************************
*EXTRA Aufgabe --> Neuer Flughafen
*Aufgabe: Fügen Sie dem Datensatz einen neuen Flughafen hinzu.
*Tabelle: SAIRPORT
****************************************************************************
*DATA(ls_airport) = VALUE sairport(
*id = 'BIH'
*name = 'Derventa, Bosnia and Herzegowina'
*time_zone = 'UTC+1'
*).
*
*INSERT sairport FROM ls_airport.
*IF sy-subrc = 0.
*  WRITE 'Insert Extra Aufgabe - Du hast erfolgreich Daten hinzugefügt'.
*ELSE.
*  WRITE 'Insert Extra Aufgabe - Daten wurden nicht hinzugefügt'.
*ENDIF.
