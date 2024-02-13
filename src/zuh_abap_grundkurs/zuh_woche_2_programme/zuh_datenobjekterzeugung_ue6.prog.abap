*&---------------------------------------------------------------------*
*& Report ZUH_DATENOBJEKTERZEUGUNG_UE6
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_datenobjekterzeugung_ue6.

TYPES: BEGIN OF lty_person,
         name  TYPE string,
         alter TYPE i,
       END OF lty_person.

DATA lr_ref TYPE REF TO data.


FIELD-SYMBOLS <feldsymbol> TYPE lty_person.

CREATE DATA lr_ref TYPE lty_person.

ASSIGN lr_ref->* TO <feldsymbol>.

<feldsymbol>-name = 'Meier'.
<feldsymbol>-alter = 40.

write: <feldsymbol>-name, <feldsymbol>-alter.
