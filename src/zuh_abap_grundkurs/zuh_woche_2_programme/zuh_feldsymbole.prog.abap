*&---------------------------------------------------------------------*
*& Report ZUH_FELDSYMBOLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_feldsymbole.

DATA lv_zahl TYPE i VALUE 5.

FIELD-SYMBOLS <feldsymbol> TYPE i.

ASSIGN lv_zahl TO <feldsymbol>.

UNASSIGN <feldsymbol>.



*Aufhebung der Zuweisung:
*UNASSign <feldsymbol>

*Prüfung auf Zuweisung:.
*IF <feldsymbol> IS ASSIGNED.
*  oder .
*IF <feldsymbol> IS NOT ASSIGNED.

IF <feldsymbol> IS ASSIGNED.
  <feldsymbol> = 20.
  WRITE lv_zahl.
ELSE.
  WRITE 'Keine Zuweisenung vorhanden'.

ENDIF.
