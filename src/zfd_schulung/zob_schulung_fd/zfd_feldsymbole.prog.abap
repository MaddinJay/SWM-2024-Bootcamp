*&---------------------------------------------------------------------*
*& Report ZFD_FELDSYMBOLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_feldsymbole.

DATA lv_zahl TYPE i VALUE 5.

FIELD-SYMBOLS <feldsymbol> TYPE i.

ASSIGN lv_zahl TO <feldsymbol>.

*UNASSIGN <feldsymbol>. "Aufheben der Zuweisung!

IF <feldsymbol> IS ASSIGNED.
  <feldsymbol> = 20.
  WRITE lv_zahl.
ELSE.
  WRITE 'keine Zuweisung vorhanden'.
ENDIF.

**********************************************************************
*Beginn Übung1: Feldsymbole
**********************************************************************
TYPES: BEGIN OF lty_s_person,
         name  TYPE string,
         alter TYPE i,
       END OF lty_s_person.

TYPES lty_t_personen type TABLE OF lty_s_person.

DATA: ls_person TYPE lty_s_person,
      lt_personen TYPE lty_t_personen.

FIELD-SYMBOLS <fs_person> TYPE lty_s_person.

ASSIGN ls_person to <fs_person>.

*ls_person-name = 'Florian'.
*ls_person-alter = 25.
*Clear ls_person.

<fs_person>-name = 'Florian'.
<fs_person>-alter = 25.

Append <fs_person> TO lt_personen.
CLEAR <fs_person>.

<fs_person>-name = 'Richard'.
<fs_person>-alter = 52.

Append <fs_person> TO lt_personen.
CLEAR <fs_person>.

LOOP AT lt_personen INTO <fs_person>.
  write: /, <fs_person>-name, <fs_person>-alter.
  CLEAR <fs_person>.
ENDLOOP.
