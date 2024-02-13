*&---------------------------------------------------------------------*
*& Report zob_uebung_insert
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_insert.

*Übung: Insert
*Aufgabenstellung
*Fügen Sie einen Eintrag in die SCUSTOM Tabelle ein


*Data(ls_kunde) = VALUE scustom(
*name = 'Max Meier'
*city = 'Hamburg'
*id = 5099
*).
*
*insert scustom from ls_kunde.
*if sy-subrc = 0.
* write 'wurde hinzugefügt'.
* else.
* write 'wurde nicht hinzugefügt.'.
* endif.


*Aufgabenstellung
*Ändern Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.

*Update scustom set name = 'Heidi Mustermann' where id = '5099'.
*
*if sy-subrc = 0.
*write 'wurde hinzugefügt'.
*else.
*write 'wurde nicht hinzugefügt.'.
*endif.


Data(ls_kunde) = VALUE scustom(
name = 'Max Meier'
city = 'Hamburg'
id = 5099
).
ls_kunde-city = 'Frankfurt'.
Update scustom from ls_kunde.

if sy-subrc = 0.
write 'wurde hinzugefügt'.
else.
write 'wurde nicht hinzugefügt.'.
endif.




*Aufgabenstellung
*Löschen Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
