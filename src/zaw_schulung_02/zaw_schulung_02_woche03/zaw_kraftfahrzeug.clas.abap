CLASS zaw_kraftfahrzeug DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: hersteller TYPE string,
          marke      TYPE string,
          hubraum    TYPE i,
          max_speed  TYPE i,
          lackierung TYPE string.

    METHODS: starten,
      beschleunigen,
      abbremsen,
      anhalten,
      umlackieren.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zaw_kraftfahrzeug IMPLEMENTATION.

  METHOD starten.
    WRITE 'Bitte starten!'.
  ENDMETHOD.

  METHOD anhalten.

  ENDMETHOD.

  METHOD beschleunigen.

  ENDMETHOD.

  METHOD abbremsen.

  ENDMETHOD.

  METHOD umlackieren.

  ENDMETHOD.

ENDCLASS.
