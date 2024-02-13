CLASS zlv_kraftfahrzeug DEFINITION
  PUBLIC
  "FINAL
  CREATE PUBLIC . "klassen attribute mit DATA:

  PUBLIC SECTION.
    DATA: hersteller TYPE string, "wir müssen typisieren, weil es eine variable ist
          marke      TYPE string,
          hubraum    TYPE integer,
          maxspeed   TYPE integer,
          lackierung TYPE string.


    METHODS: starten, "methoden
      beschleunigen,
      abbremsen,
      anhalten,
      umlackieren.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zlv_kraftfahrzeug IMPLEMENTATION.
  METHOD starten.
    WRITE: / 'motor startet'.
  ENDMETHOD.

  METHOD beschleunigen.
    WRITE: / 'fahrzeug beschleunigt'.
  ENDMETHOD.

  METHOD abbremsen.
    WRITE: / 'fahrzeug bremst ab'.
  ENDMETHOD.

  METHOD anhalten.
    WRITE: / 'fahrzeug hält an'.
  ENDMETHOD.

  METHOD umlackieren.
    WRITE: / 'fahrzeug umlackiert'.
  ENDMETHOD.

ENDCLASS.


