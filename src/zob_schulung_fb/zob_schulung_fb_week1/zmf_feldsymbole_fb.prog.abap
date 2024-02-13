*&---------------------------------------------------------------------*
*& Report ZMF_FELDSYMBOLE_FB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMF_FELDSYMBOLE_FB.

DATA lv_zahl TYPE i VALUE 5.

FIELD-SYMBOLS <feldsymbol> TYPE i.

ASSIGN lv_zahl TO <feldsymbol>.

*UNASSIGN <feldsymbol>.

WRITE lv_zahl.

*IF <feldsymbol> IS ASSIGNED.
*
*<feldsymbol> = 20.
*
*WRITE lv_zahl.
*
*ELSE.
*
*WRITE 'Keine Zuweisung vorhanden'.
*
*ENDIF.
