CLASS zcl_glas DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES yif_hum_gefaess.

    METHODS constructor IMPORTING io_getraenk TYPE REF TO zcl_hum_getraenk.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mo_getraenk TYPE REF TO zcl_hum_getraenk.

ENDCLASS.



CLASS zcl_glas IMPLEMENTATION.

  METHOD constructor.   "Constructor gibt es nur in der Klasse, niemals im Interface.
    " Instanziiere mo_getränk
    mo_getraenk = io_getraenk .
  ENDMETHOD.

  METHOD yif_hum_gefaess~fuellen.
    mo_getraenk->erhoehe_menge( iv_getraenk_menge = iv_menge ).

  ENDMETHOD.

  METHOD yif_hum_gefaess~get_fuellmenge.
    rv_Menge = mo_getraenk->get_menge( ).

  ENDMETHOD.

  METHOD yif_hum_gefaess~leeren.
    mo_getraenk->reduziere_menge( iv_getraenk_menge = iv_menge ).

  ENDMETHOD.

ENDCLASS.
