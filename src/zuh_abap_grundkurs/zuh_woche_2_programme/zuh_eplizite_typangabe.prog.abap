*&---------------------------------------------------------------------*
*& Report ZUH_EPLIZITE_TYPANGABE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUH_EPLIZITE_TYPANGABE.

TYPES: BEGIN OF lty_datum,
         jahr(4)  TYPE n,
         monat(2) TYPE n,
         tag(2)   TYPE n,
       END OF  lty_datum.

FIELD-SYMBOLS: <feldsymbol> type any,
               <wert> type n.

ASSIGN sy-datum to <feldsymbol> casting TYPE lty_datum.

DO.
  ASSIGN COMPONENT sy-index of STRUCTURE <feldsymbol> to  <wert>.
  IF  sy-subrc <> 0.
    EXIT.
  ENDIF.
  write / <wert>.

ENDDO.
