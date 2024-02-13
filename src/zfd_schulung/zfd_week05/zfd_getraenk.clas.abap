CLASS zfd_getraenk DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: get_name RETURNING VALUE(rv_name) type string.
    METHODS: reduziere_menge IMPORTING iv_getraenk_menge2 TYPE int1.
    METHODS: erhoehe_menge IMPORTING  iv_getraenk_menge1 TYPE int1.
    METHODS: get_menge RETURNING VALUE(rv_getraenk_menge) TYPE i.
    METHODS: constructor IMPORTING iv_getraenk_name TYPE string.

  PROTECTED SECTION.
    DATA: mv_fuellmenge TYPE i.
    DATA: mv_getraenke_art TYPE string.
  PRIVATE SECTION.


ENDCLASS.


CLASS zfd_getraenk IMPLEMENTATION.

  METHOD erhoehe_menge.
    mv_fuellmenge = mv_fuellmenge + iv_getraenk_menge1.
  ENDMETHOD.

  METHOD get_menge.
    rv_getraenk_menge = mv_fuellmenge.
  ENDMETHOD.

  METHOD reduziere_menge.
    mv_fuellmenge = mv_fuellmenge - iv_getraenk_menge2.
  ENDMETHOD.

  METHOD constructor.
    mv_fuellmenge = 1.
    mv_getraenke_art = iv_getraenk_name.
  ENDMETHOD.

  METHOD get_name.
    rv_name = mv_getraenke_art.
  ENDMETHOD.

ENDCLASS.
