*&---------------------------------------------------------------------*
*& Report ZOD_FELDSYMBOLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_feldsymbole.

TYPES: BEGIN OF lty_s_person,
         Name  TYPE STring,
         Alter TYPE i,
       END OF lty_s_person.

DATA ls_person TYPE lty_s_person.
DATA lt_person TYPE TABLE OF lty_s_person.

FIELD-SYMBOLS <feldsymbol> TYPE lty_s_person.
FIELD-SYMBOLS <feldsymbol2> TYPE STANDARD TABLE.

ASSIGN ls_person TO <feldsymbol>.
ASSIGN lt_person TO <feldsymbol2>.


<feldsymbol>-Name = 'Mora'.
<feldsymbol>-Alter = '5'.
INSERT <feldsymbol> INTO TABLE <feldsymbol2>.

<feldsymbol>-Name = 'Müller'.
<feldsymbol>-Alter = '50'.
INSERT <feldsymbol> INTO TABLE <feldsymbol2>.

LOOP AT <feldsymbol2> ASSIGNING <feldsymbol>.
  WRITE: / <feldsymbol>-name, <feldsymbol>-Alter.

ENDLOOP.
