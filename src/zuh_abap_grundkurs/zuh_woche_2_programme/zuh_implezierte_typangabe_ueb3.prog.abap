*&---------------------------------------------------------------------*
*& Report ZUH_IMPLEZIERTE_TYPANGABE_UEB3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUH_IMPLEZIERTE_TYPANGABE_UEB3.

TYPES: BEGIN OF lty_uhrzeit,    "die Reihenfolge ist hier wichtig, sonst werden die falschen Werte zugeordent.
         stunde(2)  TYPE n,
         minute(2) TYPE n,
         sekunde(2)   TYPE n,
       END OF  lty_uhrzeit.

FIELD-SYMBOLS <feldsymbol> type lty_uhrzeit.

ASSIGN sy-uzeit to <feldsymbol> CASTING.

Write: <feldsymbol>-stunde, <feldsymbol>-minute, <feldsymbol>-sekunde.
write sy-uzeit.
