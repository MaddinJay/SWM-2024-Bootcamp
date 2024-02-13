CLASS zst_uebung_getraenk DEFINITION
  PUBLIC
    CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor.
    METHODS erhoehte_menge IMPORTING iv_getraenk_menge TYPE int1.
    METHODS reduzierte_menge IMPORTING iv_getraenk_menge TYPE int1.
    METHODS get_menge RETURNING VALUE(rv_menge) TYPE int1.

  PROTECTED SECTION.
DATA mv_menge TYPE int1.
Data go_menge Type int1.

  PRIVATE SECTION.


ENDCLASS.



CLASS zst_uebung_getraenk IMPLEMENTATION.
  METHOD erhoehte_menge.
    mv_menge = mv_menge + iv_getraenk_menge.

  ENDMETHOD.

  METHOD get_menge.
    rv_menge = mv_menge.

  ENDMETHOD.

  METHOD reduzierte_menge.
    mv_menge = mv_menge - iv_getraenk_menge.

  ENDMETHOD.

  METHOD constructor.
mv_menge = 1.
  ENDMETHOD.

ENDCLASS.
