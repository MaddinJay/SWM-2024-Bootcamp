*&---------------------------------------------------------------------*
*& Report z_ob_re_mn_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_mn_extra_tab01.

"Deklarieren Sie einen Integertyp der Länge 3.

TYPES: ty_interger3 TYPE int1.

TYPES: BEGIN OF ty_s_teilnehmer,
         id         TYPE ty_interger3,
         vorname    TYPE string,
         nachname   TYPE c LENGTH 1,
         alter      TYPE i,
         softskills TYPE string,
       END OF ty_s_teilnehmer.

DATA: lt_teilnehmer TYPE TABLE OF ty_s_teilnehmer,
      ls_teilnehmer TYPE ty_s_teilnehmer.

*DATA: BEGIN OF ls_teilnehmer,
*        id         TYPE ty_interger3,
*        vorname    TYPE string,
*        nachname   TYPE c LENGTH 1,
*        alter      TYPE i,
*        softskills TYPE string,
*      END OF ls_teilnehmer.
*
*DATA: lt_teilnehmer LIKE TABLE OF ls_teilnehmer.

*Variante 1
ls_teilnehmer-id = 1.
ls_teilnehmer-vorname = 'Heinz'.
ls_teilnehmer-nachname = 'B'.
ls_teilnehmer-alter = 61.
ls_teilnehmer-softskills = 'leidenschaftlicher Programmierer'.

APPEND ls_teilnehmer TO lt_teilnehmer.

"Variante 2
ls_teilnehmer = VALUE #(
  id = 2
  vorname = 'Karl'
  nachname = 'S'
  alter = 61
  softskills = '-'
).

APPEND ls_teilnehmer TO lt_teilnehmer.

"Variante 3

APPEND VALUE #( id = 3 vorname = 'Dieter' nachname = 'C' alter = 34 ) TO lt_teilnehmer.

"Variante 4 , aber statt APPEND mit INSERT

*ls_teilnehmer-id = 5.
*ls_teilnehmer-vorname = 'Heinz'.
*ls_teilnehmer-nachname = 'B'.
*ls_teilnehmer-alter = 61.
*ls_teilnehmer-softskills = 'leidenschaftlicher Programmierer'.
*
*INSERT ls_teilnehmer INTO lt_teilnehmer.

"Variante 5 mit BASE
lt_teilnehmer = VALUE #( BASE lt_teilnehmer ( id = 6 vorname = 'Emma' nachname = 'V' alter = 43 ) ).

WRITE 'ENDE'.
