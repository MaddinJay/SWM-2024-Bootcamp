*&---------------------------------------------------------------------*
*& Report zaw_uebung_aenderung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_aenderung.


" Fügen Sie einen Eintrag in die SCUSTOM Tabelle ein.

INSERT INTO scustom VALUES @( VALUE
#( id = '4689'                         " -> Primärschlüssel muss angegeben werden!
name = 'Jack Bower'
form = 'Mr'
street = '75 Golden Gate Drive'
postcode = '22334'
city = 'San Francisco') ).


" Ändern Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle

UPDATE scustom                                                                " Welche Tabelle soll geändert werden.
SET street = 'Sir Wellington Road', postcode = 'L08 5RZ', city = 'Liverpool'  " Was soll geändert werden.
WHERE id = '4689'.                                                            " Wo kommt die Änderung hin (am besten Primärschlüssel).


" Löschen Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.

DELETE
FROM scustom
WHERE id = '4689'.              " Zeile, die aus der Tabelle gelöscht werden soll, Identifikation anhand des Primärschlüssels.

" Bitte Eintrag anlegen, ändern und löschen. Tabellen: stravelag

INSERT INTO stravelag VALUES @( VALUE
#( agencynum = '54'
name = 'Back to the roots'
telephone = '+49 999999999999') ).

UPDATE stravelag
SET name = 'No Return', street = 'street'
WHERE agencynum = '54'.

DELETE
FROM stravelag
WHERE agencynum = '54'.


" Bitte Eintrag anlegen, ändern und löschen. Tabellen: scounter
