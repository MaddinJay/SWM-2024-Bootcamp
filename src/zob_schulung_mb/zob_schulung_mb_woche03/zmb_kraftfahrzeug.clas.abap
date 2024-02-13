CLASS zmb_kraftfahrzeug DEFINITION
  PUBLIC
 CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: hersteller TYPE string,
          marke      TYPE string,
          hubraum    TYPE i,
          maxspeed   TYPE i,
          Lackierung TYPE string.

    METHODS starten.
    METHODS beschleunigen.
    METHODS abbremsen.
    METHODS anhalten.
    METHODS umlackieren.

*Methods: starten, beschleunigen, abbremsen, anhalten, umlackieren. -> Kettensatz

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmb_kraftfahrzeug IMPLEMENTATION.
  METHOD starten.
  write 'starten'.

  ENDMETHOD.

  METHOD abbremsen.
write 'abbremsen'.
  ENDMETHOD.

  METHOD anhalten.
write 'anhalten'.
  ENDMETHOD.

  METHOD beschleunigen.
write 'beschleunigen'.
  ENDMETHOD.

  METHOD umlackieren.
write 'umlackieren'.
  ENDMETHOD.

ENDCLASS.
