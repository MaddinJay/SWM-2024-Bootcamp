*&---------------------------------------------------------------------*
*& Report ZFD_FELSYMBOLE_DYNAMISCH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFD_FELDSYMBOLE_DYNAMISCH.

Data: lv_zahl TYPE i VALUE 10,
      lv_name TYPE string VALUE 'Meier'.

FIELD-SYMBOLS <feldsymbol> TYPE any.

ASSIGN lv_zahl to <feldsymbol>.

<feldsymbol> = 20.

ASSIGN lv_name to <feldsymbol>.

<feldsymbol> = 'Koch'.

write: lv_zahl, lv_name, <feldsymbol>.

**********************************************************************
*Typkonflikte bei generischen Feldsysmbolen
**********************************************************************

FIELD-SYMBOLS <zahl> TYPE any.
FIELD-SYMBOLS <name> TYPE any.

ASSIGN lv_zahl to <zahl>.
ASSIGN lv_name to <name>.

<zahl> = <name>. " nicht möglich , Syntaxcheck erkennt den Fehler nicht  -> Laufzeitfehler erscheint.
