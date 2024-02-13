CLASS zfb_kraftfahrzeug DEFINITION
  PUBLIC

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
            umlackieren.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zfb_kraftfahrzeug IMPLEMENTATION.

  METHOD starten.

  ENDMETHOD.

  METHOD beschleunigen.

      WRITE 'Auto beschleunigen'.

  ENDMETHOD.

  METHOD abbremsen.

  ENDMETHOD.

  METHOD anhalten.

  ENDMETHOD.

  METHOD umlackieren.

  ENDMETHOD.

ENDCLASS.
