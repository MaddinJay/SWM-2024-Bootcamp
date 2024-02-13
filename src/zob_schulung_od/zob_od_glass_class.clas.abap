CLASS zob_od_glass_class DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES: zob_od_yif_gefaess.
     aliases fuellen for zob_od_yif_gefaess~fuellen.
     aliases leeren for zob_od_yif_gefaess~leeren.
     aliases get_fuellmenge for zob_od_yif_gefaess~get_fuellmenge.


    METHODS constructor IMPORTING io_getraenk TYPE REF TO zob_od_getraenk_class.

*    METHODS fuellen IMPORTING iv_menge TYPE int1.
*    METHODS leeren  IMPORTING iv_menge TYPE int1.
*    METHODS get_fuellmenge RETURNING VALUE(rv_menge) TYPE int1.

  PROTECTED SECTION.
  PRIVATE SECTION.
*    DATA: mo_getraenk TYPE REF TO zob_od_getraenk_class.
    DATA: mo_getraenk TYPE REF TO zob_od_getraenk_class.
ENDCLASS.



CLASS zob_od_glass_class IMPLEMENTATION.

  METHOD constructor.
    " Instanziiere mo_getränk
    mo_getraenk = io_getraenk.
  ENDMETHOD.

  METHOD zob_od_yif_gefaess~fuellen.
    mo_getraenk->erhoehe_menge( iv_getraenk_menge = iv_menge ).
  ENDMETHOD.

  METHOD zob_od_yif_gefaess~get_fuellmenge.
    rv_Menge = mo_getraenk->get_menge( ).
  ENDMETHOD.

  METHOD zob_od_yif_gefaess~leeren.
    mo_getraenk->reduziere_menge( iv_getraenk_menge = iv_menge ).
  ENDMETHOD.

ENDCLASS.
