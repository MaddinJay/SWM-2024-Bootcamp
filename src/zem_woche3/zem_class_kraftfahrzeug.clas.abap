CLASS zem_class_kraftfahrzeug DEFINITION

  PUBLIC
   CREATE PUBLIC .

  PUBLIC SECTION.

    DATA hersteller TYPE string.
    DATA marke(20) TYPE c.
    DATA hub TYPE n.
    DATA maxspeed(3) TYPE n.
    DATA lackierung TYPE string.


    METHODS:  starten,
              beschleunigen,
              abbremsen,
              anhalten,
              umlackieren.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zem_class_kraftfahrzeug IMPLEMENTATION.
  METHOD starten.



  ENDMETHOD.

  METHOD abbremsen.

  maxspeed = 350.

  Write: maxspeed.

  ENDMETHOD.

  METHOD anhalten.

  ENDMETHOD.

  METHOD beschleunigen.

  ENDMETHOD.

  METHOD umlackieren.

  ENDMETHOD.

ENDCLASS.
