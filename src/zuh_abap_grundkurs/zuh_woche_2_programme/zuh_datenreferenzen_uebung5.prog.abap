*&---------------------------------------------------------------------*
*& Report ZUH_DATENREFERENZEN_UEBUNG5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_datenreferenzen_uebung5.

TYPES: BEGIN OF lty_person,
         name  TYPE string,
         alter TYPE i,
       END OF lty_person.

DATA ls_struktur TYPE lty_person.
DATA lt_table TYPE TABLE OF lty_person.

DATA lr_ref TYPE REF TO Data.

FIELD-SYMBOLS <feldsymbol> TYPE lty_person.

GET REFERENCE OF ls_struktur INTO lr_ref.

ASSIGN lr_ref->* TO <feldsymbol>.

<feldsymbol>-name = 'Meier'.
<feldsymbol>-alter = 54.
INSERT lr_ref->* INTO TABLE lt_table.

<feldsymbol>-name = 'Müller'.
<feldsymbol>-alter = 20.
INSERT <feldsymbol> INTO TABLE lt_table.

LOOP AT lt_table INTO lr_ref->*.
  WRITE: / <feldsymbol>-name, <feldsymbol>-alter.

ENDLOOP.
