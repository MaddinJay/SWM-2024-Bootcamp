*&---------------------------------------------------------------------*
*& Report ZFD_DATENOBJEKTERZEUGUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFD_DATENOBJEKTERZEUGUNG.

*DATA lr_ref type REF TO i.
DATA lr_ref type REF TO data.
data typename type string VALUE 'i'.

FIELD-SYMBOLS <feldsymbol> TYPE i.

Create DATA lr_ref TYPE (typename).

ASSIGN lr_ref->* to <feldsymbol>.

<feldsymbol> = 20.

write <feldsymbol>.
