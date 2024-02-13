*&---------------------------------------------------------------------*
*& Report ZUH_IMPLEZIERTE_TYPANGABE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_implezierte_typangabe.

TYPES: BEGIN OF lty_datum,
         jahr(4)  TYPE n,
         monat(2) TYPE n,
         tag(2)   TYPE n,
       END OF  lty_datum.

FIELD-SYMBOLS <fs> type lty_datum.

ASSIGN sy-datum to <fs> casting.

write: <fs>-jahr, <fs>-tag, <fs>-monat.
