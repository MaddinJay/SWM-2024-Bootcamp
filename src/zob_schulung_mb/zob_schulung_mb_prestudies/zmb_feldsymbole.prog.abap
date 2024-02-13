*&---------------------------------------------------------------------*
*& Report ZMB_FELDSYMBOLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_feldsymbole.

DATA lv_zahl TYPE i VALUE 5.

FIELD-SYMBOLS <feldsymbol> TYPE i.

ASSIGN lv_zahl TO <feldsymbol>.

*UNASSIGN <feldsymbol>.

IF <feldsymbol> IS ASSIGNED.

  <feldsymbol> = 20.

  WRITE lv_zahl.

ELSE.

  WRITE 'Keine Zuweisung vorhanden'.

  ENDIF.
