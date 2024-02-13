CLASS zst_schulung_uebung_kfz DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: lv_hersteller TYPE string,
          lv_marke      TYPE string,
          lv_hubraum    TYPE i,
          lv_max        TYPE i,
          lv_lackierung TYPE string.

    METHODS:
      starten, "Wort "Starten" markieren + (STRG + 1)
      beschleunigen, "Alle Methoden am besten zusammen anlegen, dann STRG + 1 -> nicht implementierte Methoden einfügen
      abbremsen,
      anhalten,
      umlackieren.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zst_schulung_uebung_kfz IMPLEMENTATION.
  METHOD starten.

  ENDMETHOD.

  METHOD abbremsen.
  Write 'Bremsen!'.

  ENDMETHOD.

  METHOD anhalten.

  ENDMETHOD.

  METHOD beschleunigen.

  ENDMETHOD.

  METHOD umlackieren.

  ENDMETHOD.

ENDCLASS.
