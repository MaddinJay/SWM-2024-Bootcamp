CLASS zcl_mb_getraenk DEFINITION      "diese Klasse verwaltet Geränkemenge
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

  Methods: constructor.

    METHODS: reduziereMenge
    Importing iv_menge type i.

    METHODS: erhoeheMenge
    importing iv_menge type i.

    METHODS: get_menge
    returning value(rv_menge) type i.




  PROTECTED SECTION.

  DATA: mv_menge       TYPE i,
          Artgetraenk TYPE string.

  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_mb_getraenk IMPLEMENTATION.
  METHOD erhoehemenge.
  mv_menge = mv_menge + iv_menge.

  ENDMETHOD.

  METHOD get_menge.

  rv_menge = mv_menge.

  ENDMETHOD.

  METHOD reduzieremenge.
  mv_menge = mv_menge - iv_menge.

  ENDMETHOD.

  METHOD constructor.

  mv_menge = 1.

  ENDMETHOD.

ENDCLASS.
