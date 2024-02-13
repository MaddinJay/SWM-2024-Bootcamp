CLASS zcl_lv_getraenk DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor.
    METHODS erhoehte_menge IMPORTING iv_getranke_menge2 TYPE int1.
    METHODS erhoehe_menge IMPORTING iv_getraenk_menge TYPE int1.
    METHODS reduziere_menge IMPORTING iv_getraenk_menge TYPE int1.

    METHODS get_menge RETURNING VALUE(rv_menge) TYPE int1.

  PROTECTED SECTION.
    DATA mv_menge TYPE int1.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_lv_getraenk IMPLEMENTATION.

  METHOD erhoehe_menge.
    mv_menge = mv_menge + iv_getraenk_menge.
  ENDMETHOD.

  METHOD reduziere_menge.
    mv_menge = mv_menge - iv_getraenk_menge.
  ENDMETHOD.

  METHOD get_menge.
    rv_menge = mv_menge.
  ENDMETHOD.



  METHOD constructor.
    mv_menge = 1.
  ENDMETHOD.



  METHOD erhoehte_menge.
    mv_menge = mv_menge + ( 2 * iv_getranke_menge2 ).
  ENDMETHOD.

ENDCLASS.
