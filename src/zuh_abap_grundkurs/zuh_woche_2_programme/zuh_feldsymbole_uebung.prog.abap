*&---------------------------------------------------------------------*
*& Report ZUH_FELDSYMBOLE_UEBUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_feldsymbole_uebung.



TYPES: BEGIN OF lty_person,
         name  TYPE string,
         alter TYPE i,

       END OF lty_person.

DATA ls_struktur TYPE lty_person.
DATA lt_tabelle TYPE TABLE OF lty_person.



FIELD-SYMBOLS <person> TYPE lty_person.

ASSIGN ls_struktur TO <person>.   " die Struktur wird dem Feldsymbol zugewisen

<person>-name = 'Müller'.
<person>-alter = '22'.
INSERT <person> INTO TABLE lt_tabelle.
CLEAR <person>.

<person>-name = 'Mayer'.
<person>-alter = '33'.
INSERT <person> INTO TABLE lt_tabelle.
CLEAR <person>.

LOOP AT lt_tabelle ASSIGNING <person>.  "  die Tabelle wird dem Feldsymbol zugewiisen
  WRITE: 'Name', <person>-name,
          / 'Alter', <person>-alter.
  ULINE.
  CLEAR <person>.
ENDLOOP.
