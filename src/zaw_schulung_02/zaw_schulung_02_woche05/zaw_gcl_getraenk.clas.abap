CLASS zaw_gcl_getraenk DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      erhoehe_menge IMPORTING iv_getraenk_menge TYPE int1,
      reduziere_menge IMPORTING iv_weniger_menge TYPE int1,
      get_menge RETURNING VALUE(rv_menge) TYPE int1,
      get_name RETURNING VALUE(rv_name) TYPE string,
      constructor IMPORTING iv_name TYPE string.

  PROTECTED SECTION.

    DATA: mv_menge TYPE int1,
          name     TYPE string.


  PRIVATE SECTION.

ENDCLASS.


CLASS zaw_gcl_getraenk IMPLEMENTATION.

  METHOD erhoehe_menge.
    mv_menge = mv_menge + iv_getraenk_menge.
  ENDMETHOD.

  METHOD reduziere_menge.
    mv_menge = mv_menge - iv_weniger_menge.
  ENDMETHOD.

  METHOD get_menge.
    rv_menge = mv_menge.
  ENDMETHOD.

  METHOD constructor.
    mv_menge = 1.
    name = iv_name.
  ENDMETHOD.

  METHOD get_name.
    rv_name = name.
  ENDMETHOD.

ENDCLASS.
