CLASS zuh_kraftfahrzeug DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA hersteller TYPE string.
    DATA marke TYPE string.
    DATA mubraum TYPE i.
    DATA maxmpeed TYPE i.
    DATA lackierung TYPE string.

    METHODS starten.
    METHODS beschleunigen.
    METHODS abbremsen.
    METHODS anhalten.
    METHODS umlackieren.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zuh_kraftfahrzeug IMPLEMENTATION.
  METHOD starten.
    WRITE 'starten'.
  ENDMETHOD.

  METHOD abbremsen.
    WRITE 'abbremsen'.
  ENDMETHOD.

  METHOD anhalten.
    WRITE 'anhalten'.
  ENDMETHOD.

  METHOD beschleunigen.
    WRITE 'beschleunigen'.
  ENDMETHOD.

  METHOD umlackieren.
    WRITE 'umlackieren'.
  ENDMETHOD.

ENDCLASS.
