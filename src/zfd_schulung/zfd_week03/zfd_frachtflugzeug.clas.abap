CLASS zfd_frachtflugzeug DEFINITION INHERITING FROM zfd_flugzeuge
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      cargo       TYPE string,
      max_cargo   TYPE i,
      ladevolumen TYPE i.

    METHODS:
      frachtfixierungen_pruefen,
      temperatur_messen.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zfd_frachtflugzeug IMPLEMENTATION.
  METHOD frachtfixierungen_pruefen.

  ENDMETHOD.

  METHOD temperatur_messen.

  ENDMETHOD.

ENDCLASS.
