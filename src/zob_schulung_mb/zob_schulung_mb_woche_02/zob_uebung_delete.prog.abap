*&---------------------------------------------------------------------*
*& Report zob_uebung_delete
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_delete.

*Löschen Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle

DATA ls_kunde type scustom.
ls_kunde-id = '5099'.
delete scustom from ls_kunde.


if sy-subrc = 0.
write 'wurde gelöscht'.
else.
write 'wurde nicht gelöscht.'.
endif.
