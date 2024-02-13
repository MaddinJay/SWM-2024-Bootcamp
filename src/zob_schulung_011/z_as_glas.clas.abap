CLASS z_as_glas DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING io_getraenk TYPE REF TO z_as_getraenk.

    INTERFACES z_as_igefaess.
    ALIASES fuellen FOR z_as_igefaess~fuellen.
    ALIASES leeren FOR z_as_igefaess~leeren.
    ALIASES getfuellmenge FOR z_as_igefaess~getfuellmenge.


  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: getraenk   TYPE REF TO z_as_getraenk,
          fuellmenge TYPE i.
ENDCLASS.

CLASS z_as_glas IMPLEMENTATION.

  METHOD constructor.
    getraenk = io_getraenk.
  ENDMETHOD.

  METHOD z_as_igefaess~fuellen.
    getraenk->erhoehemenge( iv_getraenk_menge2 = iv_menge2 ).
  ENDMETHOD.

  METHOD z_as_igefaess~getfuellmenge.
    menge = getraenk->getmenge( ).
  ENDMETHOD.

  METHOD z_as_igefaess~leeren.
    getraenk->reduzieremenge( iv_getraenk_menge1 = iv_menge1 ).
  ENDMETHOD.

ENDCLASS.
