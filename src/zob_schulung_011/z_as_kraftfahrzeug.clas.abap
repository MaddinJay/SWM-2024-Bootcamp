CLASS z_as_kraftfahrzeug DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: hersteller TYPE string,
          marke      TYPE string,
          hubraum    TYPE i,
          maxSpeed   TYPE i,
          lackierung TYPE string.
    METHODS:
      starten,
      beschleunigen,
      abbremsen,
      anhalten,
      umlackieren.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_as_kraftfahrzeug IMPLEMENTATION.
  METHOD starten.

  ENDMETHOD.

  METHOD abbremsen.
    WRITE 'Du hast abgebremst!'.
    endmethod.

    METHOD anhalten.

    ENDMETHOD.

    METHOD beschleunigen.

    ENDMETHOD.

    METHOD umlackieren.

    ENDMETHOD.

ENDCLASS.
