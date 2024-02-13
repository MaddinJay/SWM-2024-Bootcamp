*&---------------------------------------------------------------------*
*& Report zob_uebung_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_extra.

*Tabellen: STRAVELAG
*          SCOUNTER
*
*Datensatz anlegen und löschen


*Data(ls_travel) = VALUE stravelag(
*name = 'Max Meier'
*agencynum = '788'
*city = 'Hamburg'
*).
*insert stravelag from ls_travel.
*delete stravelag from ls_travel.
*if sy-subrc = 0.
* write 'wurde hinzugefügt'.
* else.
* write 'wurde nicht hinzugefügt.'.
* endif.


 Data(ls_count) = value scounter(
 countnum = '88'
 carrid = 'MB'
 ).
 insert scounter from ls_count.


 if sy-subrc = 0.
 write 'wurde hinzugefügt'.
 else.
 write 'wurde nicht hinzugefügt.'.
 endif.
