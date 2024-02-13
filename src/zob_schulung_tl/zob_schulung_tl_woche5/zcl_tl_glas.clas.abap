CLASS zcl_tl_glas DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: zif_gefaess_tl.

    METHODS constructor IMPORTING io_getraenk TYPE REF TO zcl_tl_getraenk.

*    METHODS fuellen IMPORTING iv_fuellen TYPE int1.
*    METHODS leeren IMPORTING iv_leeren TYPE int1.
*    METHODS get_fuellmenge RETURNING VALUE(rv_fuellmenge) TYPE int1.


  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: mo_getraenk TYPE REF TO zcl_tl_getraenk.


ENDCLASS.



CLASS zcl_tl_glas IMPLEMENTATION.

  METHOD constructor.
    mo_getraenk = io_getraenk.
  ENDMETHOD.

  METHOD zif_gefaess_tl~fuellen.
    mo_getraenk->erhoehte_menge( iv_erhoehte_menge = iv_fuellen ).
    WRITE: 'Füllmenge: ', iv_fuellen.
  ENDMETHOD.

  METHOD zif_gefaess_tl~get_fuellmenge.
    rv_fuellmenge = mo_getraenk->get_menge(  ).
  ENDMETHOD.

  METHOD zif_gefaess_tl~leeren.
    mo_getraenk->reduzierte_menge( iv_reduzierte_menge = iv_leeren ).
    WRITE: /'Leermenge: ', iv_leeren.
  ENDMETHOD.

ENDCLASS.

*  METHOD fuellen.
*  ENDMETHOD.
*
*  METHOD get_fuellmenge.
*  ENDMETHOD.
*
*  METHOD leeren.
*  ENDMETHOD.
