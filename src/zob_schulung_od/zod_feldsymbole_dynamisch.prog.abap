*&---------------------------------------------------------------------*
*& Report ZOD_FELDSYMBOLE_DYNAMISCH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOD_FELDSYMBOLE_DYNAMISCH.

DATA: lv_zahl TYPE i VALUE 10,
      lv_name TYPE string VALUE 'Maier'.

FIELD-SYMBOLS <feldsymbol> TYPE any.
ASSIGN  lv_zahl TO <feldsymbol>.
<feldsymbol> = 20.

ASSIGN lv_name TO <feldsymbol>.
<feldsymbol> = 'Hans'.

WRITE: 'Alter: ', lv_zahl, /, 'Name: ', lv_name.
