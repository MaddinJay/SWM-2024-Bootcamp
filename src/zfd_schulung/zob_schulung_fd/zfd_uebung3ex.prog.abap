*&---------------------------------------------------------------------*
*& Report ZFD_UEBUNG3EX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFD_UEBUNG3EX.

TYPES: BEGIN OF lty_zeit,
         stunde(2)  TYPE n,
         minute(2) TYPE n,
         sekunde(2) TYPE n,
       END OF lty_zeit.

FIELD-SYMBOLS: <feldsymbol> TYPE ANY,
               <wert> type n.

ASSIGN sy-uzeit TO <feldsymbol>  CASTING TYPE lty_zeit.

Do.
  ASSIGN Component sy-index OF STRUCTURE <feldsymbol> to <wert>.
  IF sy-subrc <> 0.
    exit.
  ENDIF.

write <wert>.
ENDDO.
