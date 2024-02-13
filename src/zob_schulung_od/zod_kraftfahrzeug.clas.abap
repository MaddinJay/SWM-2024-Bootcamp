CLASS zod_kraftfahrzeug DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: hersteller TYPE string,
          marke      TYPE string,
          hubraum    TYPE i,
          maxspeed   TYPE i,
          lackierung TYPE string.

    METHODS: starten,
      beschleunigen,
      abbremsen,
      anhalten,
      umlackierung.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zod_kraftfahrzeug IMPLEMENTATION.
  METHOD starten.
 WRITE 'startetn'.
  ENDMETHOD.

  METHOD beschleunigen.
 WRITE 'beschleunigen'.
  ENDMETHOD.

  METHOD abbremsen.
 WRITE 'abbrensen'.

  ENDMETHOD.

  METHOD anhalten.

  ENDMETHOD.

  METHOD umlackierung.

  ENDMETHOD.

ENDCLASS.
