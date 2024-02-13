CLASS ztw_kraftfahrzeug DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: hersteller TYPE string,
          marke      TYPE string,
          hubraum    TYPE i,
          speed      TYPE i,
          lackierung TYPE string.

    METHODS: starten, beschleunigen, abbremsen, anhalten, umlackieren.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztw_kraftfahrzeug IMPLEMENTATION.
  METHOD starten.
WRITE 'Motor startet'.
  ENDMETHOD.

  METHOD beschleunigen.
WRITE 'Kraftfahrzeug beschleunigt'.
  ENDMETHOD.

  METHOD abbremsen.
WRITE 'Kraftfahrezug bremst ab'.
  ENDMETHOD.

  METHOD anhalten.
WRITE 'Kraftfahrzeug haltet an'.
  ENDMETHOD.

  METHOD umlackieren.
WRITE 'Kraftfahrzeug wird umlackiert'.
  ENDMETHOD.

ENDCLASS.
