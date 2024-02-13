*&---------------------------------------------------------------------*
*& Report z_ob_re_mn_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_mn_extra.

"Deklarieren Sie einen Integertyp der Länge 3.

types: ty_interger3 TYPE int1.

* - ID. Verwenden Sie den zuvor definierten Typ
*- Vorname
*- Erster Buchstabe des Nachnamens
*- Alter
*- Softskills

DATA: BEGIN OF ls_teilnehmer,
      id TYPE ty_interger3,
      vorname type string,
      nachname type c LENGTH 1,
      alter type i,
      softskills type string,
      END OF LS_TEILNEHMER.

  ls_teilnehmer-id = 1.
  ls_teilnehmer-vorname = 'Heinz'.
  ls_teilnehmer-nachname = 'B'.
  ls_teilnehmer-alter = 61.
  ls_teilnehmer-softskills = 'leidenschaftlicher Programmierer'.

"Alternative
  ls_teilnehmer = VALUE #(
    id = 1
    vorname = 'Heinz'
    nachname = 'B'
    alter = 60
    softskills = '-'
  ).
