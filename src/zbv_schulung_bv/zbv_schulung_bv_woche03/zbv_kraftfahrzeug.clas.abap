CLASS zbv_kraftfahrzeug DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: hersteller TYPE string,
          marke TYPE string,
          hubraum TYPE string,
          max_speed TYPE i,
          lackierung TYPE string.

    METHODS: starten,
             beschleunigen,
             abbremsen,
             anhalten,
             umlackieren.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbv_kraftfahrzeug IMPLEMENTATION.

  METHOD starten.

  ENDMETHOD.


  METHOD beschleunigen.
  WRITE 'beschleunigen'.
  ENDMETHOD.


  METHOD abbremsen.

  ENDMETHOD.


  METHOD anhalten.

  ENDMETHOD.


  METHOD umlackieren.

  ENDMETHOD.

ENDCLASS.
