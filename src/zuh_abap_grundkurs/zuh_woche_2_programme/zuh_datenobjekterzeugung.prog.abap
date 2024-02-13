*&---------------------------------------------------------------------*
*& Report ZUH_DATENOBJEKTERZEUGUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUH_DATENOBJEKTERZEUGUNG.

DATA lr_ref TYPE REF TO data.
DATA typename TYPE string VALUE 'i'.

FIELD-SYMBOLS <feldsymbol> TYPE i.

CREATE DATA lr_ref TYPE (typename).

ASSIGN lr_ref->* to <feldsymbol>.

<feldsymbol> = 20.

write <feldsymbol>.
