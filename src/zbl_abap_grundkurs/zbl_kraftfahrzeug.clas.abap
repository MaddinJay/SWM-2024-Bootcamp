CLASS zbl_kraftfahrzeug DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: hersteller TYPE string,
          modell     TYPE string,
          hubraum    TYPE i,
          topspeed   TYPE i,
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



CLASS zbl_kraftfahrzeug IMPLEMENTATION.
  METHOD starten.

  ENDMETHOD.

  METHOD abbremsen.

  ENDMETHOD.

  METHOD anhalten.

  ENDMETHOD.

  METHOD beschleunigen.

  ENDMETHOD.

  METHOD umlackieren.

  ENDMETHOD.

ENDCLASS.
