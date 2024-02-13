*&---------------------------------------------------------------------*
*& Report ZUH_EPLIZITE_TYPANGABE_UEB3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUH_EPLIZITE_TYPANGABE_UEB3.

TYPES: BEGIN OF lty_uhr,
         stunde(2)  TYPE n,
         minute(2) TYPE n,
         sekunde(2)   TYPE n,
       END OF  lty_uhr.

FIELD-SYMBOLS: <feldsymbol> type any,
               <wert> type n.

ASSIGN sy-uzeit to <feldsymbol> casting TYPE lty_uhr.

DO.
  ASSIGN COMPONENT sy-index of STRUCTURE <feldsymbol> to  <wert>.
  IF  sy-subrc <> 0.
    EXIT.
  ENDIF.
  write / <wert>.

ENDDO.
