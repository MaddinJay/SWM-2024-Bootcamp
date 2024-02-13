CLASS zcl_mb_glas DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_mb_gefaess.
ALIASES fuellen for zif_mb_gefaess~fuellen.
ALIASES leeren for zif_mb_gefaess~leeren.
ALIASES getfuellmenge for zif_mb_gefaess~getfuellmenge.
    METHODS constructor IMPORTING io_getraenk TYPE REF TO zcl_mb_getraenk.



  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      fuellmenge  TYPE i,
      mo_getraenk TYPE REF TO zcl_mb_getraenk. " kann auch zur Klasse Wasser geändert werden


ENDCLASS.



CLASS zcl_mb_glas IMPLEMENTATION.


  METHOD constructor.
    mo_getraenk = io_getraenk.
  ENDMETHOD.

  METHOD zif_mb_gefaess~fuellen.
    mo_getraenk->erhoehemenge(  iv_menge = iv_fuellen ).
  ENDMETHOD.

  METHOD zif_mb_gefaess~getfuellmenge.
    rv_fuellmenge = mo_getraenk->get_menge( ).
  ENDMETHOD.

  METHOD zif_mb_gefaess~leeren.
    mo_getraenk->reduzieremenge(  iv_menge = iv_leeren ).
  ENDMETHOD.

ENDCLASS.

