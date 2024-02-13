*&---------------------------------------------------------------------*
*& Report ZMB_IMPLIZITE_TYPANGABE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_implizite_typangabe.

TYPES: BEGIN OF lty_datum,
jahr(4) TYPE n,
monat(2) TYPE n,
tag(2) TYPE n,
END of lty_datum.

*FIELD-SYMBOLS <fs> TYPE lty_datum.

*ASSIGN sy-datum to <fs> CASTING.

*Write:/ <fs>-tag, <fs>-monat, <fs>-jahr.

FIELD-SYMBOLS: <feldsymbol> Type any,
               <wert> TYPE n.
ASSIGN sy-datum to <feldsymbol> casting type lty_datum.

Do.
 ASSIGN COMPONENT sy-index OF STRUCTURE <feldsymbol> to <wert>.
 if sy-subrc <> 0.
   Exit.
   Endif.
   Write / <wert>.
   ENDDO.
