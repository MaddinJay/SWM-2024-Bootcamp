*&---------------------------------------------------------------------*
*& Report ZFD_IMPLIZIERTE_TYPANGABE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_implizierte_typangabe.

TYPES: BEGIN OF lty_datum,
         jahr(4)  TYPE n,
         monat(2) TYPE n,
         tag(2) TYPE n,
       END OF lty_datum.

FIELD-SYMBOLS <fs> TYPE lty_datum.

ASSIGN sy-datum TO  <fs>  CASTING.  " sy-datum = aktuelles Datum

write sy-datum.
Write: / <fs>-tag, <fs>-monat, <fs>-jahr.
