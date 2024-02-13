*&---------------------------------------------------------------------*
*& Report ZMB_DATENOBJEKTERZEUGUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMB_DATENOBJEKTERZEUGUNG.

*DATA lr_ref TYPE REF TO i.
DATA lr_ref TYPE REF TO data.
DATA typename type string value 'i'.

FIELD-SYMBOLS <feldsymbol> TYPE i.

*Create data lr_ref.
*Create data lr_ref TYPE i.
CREATE DATA lr_ref TYPE (typename).
ASSIGN lr_ref->* to <feldsymbol>.

<feldsymbol> = 20.

*lr_ref->* = 20.

*Write lr_ref->*.

WRITE <feldsymbol>.
