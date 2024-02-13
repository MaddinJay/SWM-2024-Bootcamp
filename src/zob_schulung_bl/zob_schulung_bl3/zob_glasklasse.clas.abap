
CLASS zob_glasklasse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
INTERFACES: ZBLi_gefaess.

    METHODS: Fuellen IMPORTING iv_fuellen TYPE string,
      Leeren IMPORTING iv_leeren TYPE string,
      get_fuellmenge RETURNING VALUE(rv_fuellmenge) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
     mv_getraenk   TYPE string,
     mv_fuellmenge TYPE int1.

ENDCLASS.



CLASS zob_glasklasse IMPLEMENTATION.
  METHOD fuellen.

  ENDMETHOD.

  METHOD get_fuellmenge.

  ENDMETHOD.

  METHOD leeren.

  ENDMETHOD.

ENDCLASS.
