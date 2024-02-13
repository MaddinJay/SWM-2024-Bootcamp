*&---------------------------------------------------------------------*
*& Report ZFD_UEBUNG4_DATENREFERENZ
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_uebung5_datenreferenz_gene.

TYPES: BEGIN OF lty_person,
         name  TYPE string,
         alter TYPE i,
       END OF  lty_person.

DATA: ls_struktur TYPE lty_person,
      lt_tabelle  TYPE TABLE OF lty_person,
      lr_ref      TYPE REF TO data.

FIELD-SYMBOLS <feldsymbol> type lty_person.

GET REFERENCE OF ls_struktur INTO lr_ref.

Assign lr_ref->* to <feldsymbol>.



<feldsymbol>-name = 'Boll'.
<feldsymbol>-alter = '42'.
Append <feldsymbol> to lt_tabelle.

<feldsymbol>-name = 'Fetzner'.
<feldsymbol>-alter = '53'.
Append <feldsymbol> to lt_tabelle.
*
*lr_ref->name = 'Fetzner'.
*lr_ref->alter = '53'.
*Append lr_ref->* to lt_tabelle.

LOOP AT lt_tabelle into <feldsymbol>.
  write: /, <feldsymbol>-name, <feldsymbol>-alter.
ENDLOOP.
