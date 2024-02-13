CLASS zmj_kraftfahrzeug DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: hersteller TYPE string,
          marke      TYPE string.

    METHODS:
      starten,
      beschleunigen,
      abbremsen.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zmj_kraftfahrzeug IMPLEMENTATION.

  METHOD starten.

  ENDMETHOD.

  METHOD beschleunigen.

  ENDMETHOD.

  METHOD abbremsen.

  ENDMETHOD.

ENDCLASS.
