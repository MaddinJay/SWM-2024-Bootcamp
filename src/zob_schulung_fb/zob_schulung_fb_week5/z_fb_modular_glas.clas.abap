CLASS z_fb_modular_glas DEFINITION

  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES yfb_gefaess.
    METHODS constructor IMPORTING io_getraenk TYPE REF TO z_fb_modular_getraenk.

*    METHODS fuellen IMPORTING iv_menge TYPE int1.
*    METHODS leeren  IMPORTING iv_menge TYPE int1.
*    METHODS get_fuellmenge RETURNING VALUE(rv_menge) TYPE int1.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mo_getraenk TYPE REF TO z_fb_modular_getraenk.
ENDCLASS.

CLASS z_fb_modular_glas IMPLEMENTATION.

  METHOD constructor.
    " Instanziiere mo_getränk
    mo_getraenk = io_getraenk.
  ENDMETHOD.

  METHOD yfb_gefaess~fuellen.
 mo_getraenk->erhoehe_menge( iv_getraenk_menge = iv_menge ).
  ENDMETHOD.

  METHOD yfb_gefaess~get_fuellmenge.
  rv_Menge = mo_getraenk->get_menge( ).
  ENDMETHOD.

  METHOD yfb_gefaess~leeren.
mo_getraenk->reduziere_menge( iv_getraenk_menge = iv_menge ).
  ENDMETHOD.

ENDCLASS.
