*&---------------------------------------------------------------------*
*& Report zem_arbspiel
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_arbspiel.


CLASS lcl_BLAU DEFINITION.

  PUBLIC SECTION.

    METHODS addiere.

  PRIVATE SECTION.

    DATA iv_privat1 TYPE i VALUE 7.
    DATA iv_privat2 TYPE i VALUE 5.

ENDCLASS.

CLASS lcl_blau IMPLEMENTATION.

  METHOD addiere.


    DATA ev_ergebnis TYPE i.
    DATA iv_public1 TYPE i.
    DATA iv_public2 TYPE i.

    iv_public1 = iv_privat1.
    iv_public2 = iv_privat2.

    ev_ergebnis = iv_public1 + iv_public2.

    WRITE: 'Da:', ev_ergebnis.

  ENDMETHOD.



ENDCLASS.

START-OF-SELECTION.

  DATA ev_ergebnis TYPE REF TO lcl_blau.

  CREATE OBJECT ev_ergebnis.

  CALL METHOD ev_ergebnis->addiere( ).

END-OF-SELECTION.
