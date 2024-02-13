CLASS zcl_LV_glas DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: z_lv_gafaess.
    ALIASES fuellen FOR z_lv_gafaess~fuellen.
    ALIASES leeren FOR z_lv_gafaess~leeren.
    ALIASES get_fuellmenge FOR Z_lv_gafaess~get_fuellmenge.


    METHODS constructor IMPORTING io_getraenk TYPE REF TO ZCL_LV_getraenk.
*    METHODS constructor2 IMPORTING io_fuellmenge TYPE REF TO zcl_mj_getraenk.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mo_getraenk  TYPE REF TO zcl_lv_getraenk,
          mo_getraenk2 TYPE REF TO zcl_lv_getraenk.

ENDCLASS.



CLASS zcl_lv_glas IMPLEMENTATION.

  METHOD constructor.
    " Instanziiere mo_getränk
    mo_getraenk = io_getraenk. "wir übenehmen den wert von außen.
  ENDMETHOD.

  METHOD Z_lv_gafaess~fuellen.
    mo_getraenk->erhoehe_menge( iv_getraenk_menge = iv_menge ).
  ENDMETHOD.

  METHOD Z_lv_gafaess~get_fuellmenge.
    rv_Menge = mo_getraenk->get_menge( ).
  ENDMETHOD.

  METHOD Z_lv_gafaess~leeren.
    mo_getraenk->reduziere_menge( iv_getraenk_menge = iv_menge ).
  ENDMETHOD.


ENDCLASS.
