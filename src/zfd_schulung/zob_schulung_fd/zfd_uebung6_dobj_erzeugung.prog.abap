*&---------------------------------------------------------------------*
*& Report ZFD_UEBUNG6_DOBJ_ERZEUGUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_uebung6_dobj_erzeugung.

TYPES: BEGIN OF lty_s_person,
         name  TYPE string,
         alter TYPE i,
       END OF lty_s_person.

DATA lr_ref TYPE REF TO data.


FIELD-SYMBOLS <feldsymbol> TYPE lty_s_person.

CREATE DATA lr_ref TYPE lty_s_person.

Assign lr_ref->* to <feldsymbol>.

<feldsymbol>-name = 'Joe'.
<feldsymbol>-alter = 80 .
uline.
write: <feldsymbol>-name, <feldsymbol>-alter.
