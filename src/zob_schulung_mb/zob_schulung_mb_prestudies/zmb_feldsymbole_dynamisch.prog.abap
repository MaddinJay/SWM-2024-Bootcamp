*&---------------------------------------------------------------------*
*& Report ZMB_FELDSYMBOLE_DYNAMISCH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_feldsymbole_dynamisch.

DATA lv_zahl TYPE i VALUE 10.
DATA lv_name TYPE string VALUE 'Meyer'.

*FIELD-SYMBOLS <feldsymbol> TYPE any.

*ASSIGN lv_zahl TO <feldsymbol>.

*<feldsymbol> = 20.

*ASSIGN lv_name to <feldsymbol>.

*<feldsymbol> = 'Koch'.

*Write: lv_zahl, lv_name.

FIELD-SYMBOLS <zahl> TYPE any.
FIELD-SYMBOLS <name> TYPE any.

Assign lv_zahl to <zahl>.
Assign lv_name to <name>.

<zahl> = <name>.
