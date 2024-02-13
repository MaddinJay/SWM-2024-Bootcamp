*&---------------------------------------------------------------------*
*& Report ZFD_UEBUNG3IM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFD_UEBUNG3IM.

TYPES: BEGIN OF lty_zeit,
         stunde(2)  TYPE n,
         minute(2) TYPE n,
         sekunde(2) TYPE n,
       END OF lty_zeit.

FIELD-SYMBOLS <fs> TYPE lty_zeit.

ASSIGN sy-uzeit TO  <fs>  CASTING.

write sy-uzeit.
Write: / <fs>-stunde, <fs>-minute, <fs>-sekunde.
