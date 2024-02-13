CLASS zuh_getraenk_mg DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS erhoehe_menge IMPORTING iv_getraenk_menge TYPE int1.
    METHODS reduziere_menge IMPORTING iv_getraenk_menge TYPE int1.
    METHODS get_menge RETURNING VALUE(rv_menge) TYPE int1.

    METHODS constructor.

  PROTECTED SECTION.
    DATA mv_menge TYPE int1.

  PRIVATE SECTION.

ENDCLASS.

CLASS zuh_getraenk_mg IMPLEMENTATION.
  METHOD erhoehe_menge.
    mv_menge = mv_menge + iv_getraenk_menge * 2.
  ENDMETHOD.

  METHOD get_menge.
    rv_menge = mv_menge.
  ENDMETHOD.

  METHOD reduziere_menge.
    mv_menge = mv_menge - iv_getraenk_menge.
  ENDMETHOD.

  METHOD constructor.
    mv_menge = 1 .
  ENDMETHOD.

ENDCLASS.
