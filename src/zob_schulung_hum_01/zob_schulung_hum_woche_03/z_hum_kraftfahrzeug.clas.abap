CLASS z_hum_kraftfahrzeug DEFINITION

  PUBLIC
  "FINAL muss entfernt werden, damit eine Vererbung stattfinden kann
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: Hersteller TYPE string,          "Attribut bestimmen
          Model      TYPE string,
          Hubraum    TYPE i,
          max_Speed  TYPE i,
          Lackierung TYPE string.


    METHODS:
      starten,                             "STRG+F1 auf bspw. starten, dann wird die Methode implementiert.
      beschleunigen,
      abbremsen,
      anhalten,
      umlackieren.

  PROTECTED SECTION.



  PRIVATE SECTION.
ENDCLASS.



CLASS z_hum_kraftfahrzeug IMPLEMENTATION.
  METHOD starten.

  ENDMETHOD.

  METHOD abbremsen.

  ENDMETHOD.

  METHOD anhalten.

  ENDMETHOD.

  METHOD beschleunigen.
    WRITE 'beschleunigen'.
  ENDMETHOD.

  METHOD umlackieren.

  ENDMETHOD.

ENDCLASS.
