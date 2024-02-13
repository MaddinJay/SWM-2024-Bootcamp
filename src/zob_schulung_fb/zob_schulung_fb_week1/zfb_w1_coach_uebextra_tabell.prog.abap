*&---------------------------------------------------------------------*
*& Report z_ob_re_mn_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_w1_coach_uebextra_tabell.

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
"-

"Variante 5 mit BASE
lt_teilnehmer = VALUE #( BASE lt_teilnehmer
   ( id = 6 vorname = 'Emma' nachname = 'V' alter = 43 )
   ( id = 7 vorname = 'Anne' nachname = 'R' alter = 30 )
    ).

cl_demo_output=>display( lt_teilnehmer ).

*ÜBUNG TABELLEN PART II

DATA: BEGIN OF ls_werte,
        euro type p DECIMALS 2,
        dollar type p DECIMALS 2,
      END OF ls_werte,
      lt_werte LIKE TABLE OF ls_werte.

"fester Umrechnungskurs
CONSTANTS: lc_umrechnung TYPE p DECIMALS 2 VALUE '1.09'.

PARAMETERS: p_urk TYPE p DECIMALS 2 OBLIGATORY.

INITIALIZATION.
p_urk = lc_umrechnung.

START-OF-SELECTION.
DO 100 TIMES.
  "im ersten Schleifewndurchlauf ist der Wert Initial 0.00 , darum addieren wir hier 1 am Beginn
  ls_werte-euro = ls_werte-euro + 1.
  "Berechnung des Dollarkurses mit Hilfe der Umrechnung und des Euro-Wertes
  ls_werte-dollar = ls_werte-euro * p_urk.
  "neue Zeile an die Tabelle hängen
  APPEND ls_werte TO lt_werte.
ENDDO.

cl_demo_output=>display( lt_werte ).
