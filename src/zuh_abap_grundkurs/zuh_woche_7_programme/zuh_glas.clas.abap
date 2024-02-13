CLASS zuh_glas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  Interfaces: zuh_gefaess.
  ALIASES fuellen for zuh_gefaess~fuellen.
  ALIASES leeren for zuh_gefaess~leeren.
  ALIASES get_fuellmenge for zuh_gefaess~get_fuellmenge.

    METHODS constructor IMPORTING io_getraenk TYPE REF TO zuh_getraenk_mg.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: mo_getraenk  TYPE REF TO zuh_getraenk_mg.

ENDCLASS.

CLASS zuh_glas IMPLEMENTATION.
  METHOD constructor.
    mo_getraenk = io_getraenk.
  ENDMETHOD.


  METHOD zuh_gefaess~fuellen.
mo_getraenk->erhoehe_menge( iv_getraenk_menge = iv_menge ).
  ENDMETHOD.

  METHOD zuh_gefaess~get_fuellmenge.
rv_fuellmenge = mo_getraenk->get_menge( ).
  ENDMETHOD.

  METHOD zuh_gefaess~leeren.

    mo_getraenk->reduziere_menge( iv_getraenk_menge = iv_menge ).
  ENDMETHOD.

ENDCLASS.
