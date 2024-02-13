CLASS zbl_pkw DEFINITION
  PUBLIC
  FINAL
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



CLASS zbl_pkw IMPLEMENTATION.
  METHOD abbremsen.

  ENDMETHOD.

  METHOD anhalten.

  ENDMETHOD.

  METHOD beschleunigen.

  ENDMETHOD.

  METHOD starten.

  ENDMETHOD.

  METHOD umlackieren.

  ENDMETHOD.

ENDCLASS.
