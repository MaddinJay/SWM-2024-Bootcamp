CLASS z_abap_oo_kraftfahrzeuge_tl DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: hersteller TYPE string,   "Attribut Hersteller angelegt
          marke      TYPE string,   "Attribut Marke angelegt
          hubraum    TYPE string,   "Attribut Hubraum angelegt
          maxspeed   TYPE int1,     "Attribut MaxSpeed angelegt
          lackierung TYPE string.   "Attribut Lackierung angelegt

    METHODS:
      starten,
      beschleunigen,
      abbremsen,
      anhalten,
      umlackieren. "Alle Methoden aufschreiben, dann STRG+1 --> und auf implementieren klicken




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_abap_oo_kraftfahrzeuge_tl IMPLEMENTATION.
  METHOD starten.

  ENDMETHOD.

  METHOD beschleunigen.

  ENDMETHOD.

  METHOD abbremsen.
    WRITE 'Beschleunigen'.
  ENDMETHOD.

  METHOD anhalten.

  ENDMETHOD.

  METHOD umlackieren.

  ENDMETHOD.

ENDCLASS.
