CLASS ztw_getraenk DEFINITION
  PUBLIC
CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor.
    METHODS erhoehe_menge IMPORTING iv_getraenk_menge TYPE i.
    METHODS reduziere_menge IMPORTING iv_getraenk_menge TYPE i.

    METHODS get_menge RETURNING VALUE(rv_menge) TYPE i.
 DATA: mv_menge TYPE int1.
  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ztw_getraenk IMPLEMENTATION.

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


ENDCLASS.
