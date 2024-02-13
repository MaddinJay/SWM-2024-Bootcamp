*&---------------------------------------------------------------------*
*& Report ZFD_UEBUNG2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFD_UEBUNG2. " Generische Feldsymbole

TYPES: BEGIN OF lty_s_person,
         name  TYPE string,
         alter TYPE i,
       END OF lty_s_person.

TYPES lty_t_personen type TABLE OF lty_s_person.

DATA: ls_person TYPE lty_s_person,
      lt_personen TYPE lty_t_personen.

FIELD-SYMBOLS <fs_person> TYPE lty_s_person.
*FIELD-SYMBOLS <feldsymbol> type ANY TABLE. " geht Wenn man bei Datenbefüllung statt APPEND TO -> INSERT INTO nutzt.
FIELD-SYMBOLS <feldsymbol> type STANDARD TABLE. " geht
*FIELD-SYMBOLS <feldsymbol> type INDEX TABLE. " geht
*FIELD-SYMBOLS <feldsymbol> type SORTED TABLE. " geht nicht
*FIELD-SYMBOLS <feldsymbol> type HASHED TABLE. " geht nicht

ASSIGN ls_person to <fs_person>.
ASSIGN lt_personen to <feldsymbol>.

<fs_person>-name = 'Florian'.
<fs_person>-alter = 25.

Append <fs_person> TO <feldsymbol>.
*INSERT <fs_person> INTO <feldsymbol>.
CLEAR <fs_person>.

<fs_person>-name = 'Richard'.
<fs_person>-alter = 52.

Append <fs_person> TO <feldsymbol>.
*INSERT <fs_person> INTO <feldsymbol>.
CLEAR <fs_person>.

LOOP AT <feldsymbol> INTO <fs_person>.
  write: /, <fs_person>-name, <fs_person>-alter.
  CLEAR <fs_person>.
ENDLOOP.
