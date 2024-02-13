CLASS zfd_glas DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zfd_gefaess.
    ALIASES glas_fuellen for zfd_gefaess~glas_fuellen.
    ALIASES glas_leeren for zfd_gefaess~glas_leeren.
    ALIASES get_fuellmenge for zfd_gefaess~get_fuellmenge.
    ALIASES get_name for zfd_gefaess~get_name.

    METHODS: constructor IMPORTING io_getraenk TYPE REF TO zfd_getraenk.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mo_getraenk TYPE REF TO zfd_getraenk.

ENDCLASS.

CLASS zfd_glas IMPLEMENTATION.

  METHOD constructor.
    mo_getraenk = io_getraenk.
  ENDMETHOD.

  METHOD zfd_gefaess~get_fuellmenge.
    rv_menge = mo_getraenk->get_menge( ).
  ENDMETHOD.

  METHOD zfd_gefaess~glas_fuellen.
    mo_getraenk->erhoehe_menge( iv_getraenk_menge1 = iv_menge1 ).
  ENDMETHOD.

  METHOD zfd_gefaess~glas_leeren.
     mo_getraenk->reduziere_menge( iv_getraenk_menge2 = iv_menge2 ).
  ENDMETHOD.

  method zfd_gefaess~get_name.
    rv_name = mo_getraenk->get_name( ).
  endmethod.

ENDCLASS.
