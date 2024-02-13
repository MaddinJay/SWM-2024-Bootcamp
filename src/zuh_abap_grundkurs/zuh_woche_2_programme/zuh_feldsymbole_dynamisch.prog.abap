*&---------------------------------------------------------------------*
*& Report ZUH_FELDSYMBOLE_DYNAMISCH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_feldsymbole_dynamisch.


DATA lv_zahl TYPE i VALUE 10.
DATA lv_name  TYPE string VALUE 'Meier'.

*FIELD-SYMBOLS <feldsymbol> TYPE any.
*
*ASSIGN lv_zahl TO <feldsymbol>.
*
*<feldsymbol> = 20.
*
*ASSIGN lv_name  TO <feldsymbol>.
*
*<feldsymbol> = 'koch'.
*
*WRite: lv_zahl, lv_name.

FIELD-SYMBOLS <zahl> TYPE any.
FIELD-SYMBOLS <name> TYPE any.

ASSIGN lv_zahl TO <zahl>.
ASSIGN lv_name  TO <name>.

*<zahl> = <name>.  Funktioniert nicht, da die Inhalte der Feldsymbole vom typen her nict gleich sind
