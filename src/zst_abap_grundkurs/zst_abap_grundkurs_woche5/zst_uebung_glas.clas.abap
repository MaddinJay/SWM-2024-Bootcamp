CLASS zst_uebung_glas DEFINITION
  PUBLIC
    CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES zst_uebung_gefaess.

    METHODS constructor IMPORTING io_getraenk TYPE REF TO zst_uebung_getraenk.

   PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: mo_getraenk  TYPE REF TO zst_uebung_getraenk.


ENDCLASS.


CLASS zst_uebung_glas IMPLEMENTATION.
  METHOD constructor.
    " Instanziiere mo_getränk
    mo_getraenk = io_getraenk.

  ENDMETHOD.


  METHOD zst_uebung_gefaess~fuellen.
    mo_getraenk->erhoehte_menge( iv_getraenk_menge = iv_menge ).

  ENDMETHOD.

  METHOD zst_uebung_gefaess~get_fuellmenge.
    rv_fuellmenge = mo_getraenk->get_menge( ).

  ENDMETHOD.

  METHOD zst_uebung_gefaess~leeren.
    mo_getraenk->reduzierte_menge( iv_getraenk_menge = iv_menge ).

  ENDMETHOD.

ENDCLASS.
