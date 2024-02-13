CLASS zfd_kraftfahrzeug DEFINITION
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



CLASS zfd_kraftfahrzeug IMPLEMENTATION.
  METHOD abbremsen.
    WRITE 'Bremsen!'.
  ENDMETHOD.

  METHOD anhalten.

  ENDMETHOD.

  METHOD beschleunigen.
    Write 'GIB Gas !'.
  ENDMETHOD.

  METHOD starten.

  ENDMETHOD.

  METHOD umlackieren.

  ENDMETHOD.

ENDCLASS.
