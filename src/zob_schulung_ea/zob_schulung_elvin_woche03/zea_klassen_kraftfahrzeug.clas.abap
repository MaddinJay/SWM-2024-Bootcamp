CLASS zea_klassen_kraftfahrzeug DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA hersteller TYPE string.
    DATA marke      TYPE string.
    DATA hubraum    TYPE i.
    DATA maxspeed   TYPE i.
    DATA lackierung TYPE string.



    METHODS: starten, beschleunigen, abbremsen, anhalten, umlackieren.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zea_klassen_kraftfahrzeug IMPLEMENTATION.
  METHOD starten.

  ENDMETHOD.

  METHOD beschleunigen.

  ENDMETHOD.

  METHOD abbremsen.
      WRITE 'abbremsen'.

  ENDMETHOD.

  METHOD anhalten.

  ENDMETHOD.

  METHOD umlackieren.

  ENDMETHOD.

ENDCLASS.



