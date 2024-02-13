CLASS zcl_mj_glas DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_mj_gefaess.
    ALIASES fuellen FOR zif_mj_gefaess~fuellen.
    ALIASES leeren FOR zif_mj_gefaess~leeren.
    ALIASES get_fuellmenge FOR zif_mj_gefaess~get_fuellmenge.

    METHODS constructor IMPORTING io_getraenk TYPE REF TO zcl_mj_getraenk.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mo_getraenk TYPE REF TO zcl_mj_getraenk.
ENDCLASS.

CLASS zcl_mj_glas IMPLEMENTATION.

  METHOD constructor.
    " Instanziiere mo_getränk
    mo_getraenk = io_getraenk.
  ENDMETHOD.

  METHOD zif_mj_gefaess~fuellen.
    mo_getraenk->erhoehe_menge( iv_getraenk_menge = iv_menge ).
  ENDMETHOD.

  METHOD zif_mj_gefaess~get_fuellmenge.
    rv_Menge = mo_getraenk->get_menge( ).
  ENDMETHOD.

  METHOD zif_mj_gefaess~leeren.
    mo_getraenk->reduziere_menge( iv_getraenk_menge = iv_menge ).
  ENDMETHOD.

ENDCLASS.
