CLASS z_getraenk_lv DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: artgetraenk   TYPE string,
          mengegetraenk TYPE i.

    METHODS reduzieren_menge IMPORTING iv_menge TYPE int1.
    METHODS erhoehe_menge IMPORTING iv_menge TYPE int1.
    METHODS get_menge RETURNING VALUE(rv_getmenge) TYPE int1.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_menge TYPE i.
    DATA mv_art_getraenk TYPE string.

ENDCLASS.



CLASS z_getraenk_lv IMPLEMENTATION.



  METHOD erhoehe_menge.
    mv_menge = mv_menge + iv_menge.

  ENDMETHOD.

  METHOD get_menge.
    rv_getmenge = mv_menge.
    WRITE rv_getmenge.
  ENDMETHOD.

  METHOD reduzieren_menge.
    mv_menge = mv_menge - iv_menge.
  ENDMETHOD.

ENDCLASS.
