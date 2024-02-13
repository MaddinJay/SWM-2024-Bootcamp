*&---------------------------------------------------------------------*
*& Report ZFD_EXPLIZIERTE_TYPANGABE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFD_EXPLIZIERTE_TYPANGABE.

TYPES: BEGIN OF lty_datum,
         jahr(4)  TYPE n,
         monat(2) TYPE n,
         tag(2) TYPE n,
       END OF lty_datum.

FIELD-SYMBOLS: <feldsymbol> TYPE ANY,
               <wert> type n.

ASSIGN sy-datum TO <feldsymbol>  CASTING TYPE lty_datum.

Do.
  ASSIGN Component sy-index OF STRUCTURE <feldsymbol> to <wert>.
  IF sy-subrc <> 0.
    exit.
  ENDIF.

write <wert>.
ENDDO.
