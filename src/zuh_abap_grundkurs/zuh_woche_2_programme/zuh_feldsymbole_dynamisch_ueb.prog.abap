*&---------------------------------------------------------------------*
*& Report ZUH_FELDSYMBOLE_DYNAMISCH_UEB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_feldsymbole_dynamisch_ueb.

TYPES: BEGIN OF lty_person,
         name  TYPE string,
         alter TYPE i,

       END OF lty_person.

DATA ls_struktur TYPE lty_person.
DATA lt_tabelle TYPE TABLE OF lty_person.



FIELD-SYMBOLS <person> TYPE lty_person.
FIELD-SYMBOLS <tperson> TYPE STANDARD TABLE. "INDEX oder ANY TABLE


ASSIGN ls_struktur TO <person>.   " die Struktur wird dem Feldsymbol zugewisen
ASSIGN lt_tabelle TO <tperson>.

<person>-name = 'Müller'.
<person>-alter = '22'.
INSERT <person> INTO TABLE <tperson>.
CLEAR <person>.

<person>-name = 'Mayer'.
<person>-alter = '33'.
INSERT <person> INTO TABLE <tperson>.
CLEAR <person>.

LOOP AT <tperson> ASSIGNING <person>.  "  die Tabelle wird dem Feldsymbol zugewiisen
  WRITE: 'Name', <person>-name,
          / 'Alter', <person>-alter.
  ULINE.
  CLEAR <person>.
ENDLOOP.
