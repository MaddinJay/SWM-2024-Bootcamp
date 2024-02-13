CLASS zbv_glas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: zif_bv_gefaess.

    ALIASES fuellen FOR zif_bv_gefaess~fuellen. "Aliases werden benutzt um die Methoden hier darzustellen, damit wir im Report sie wie immer aufrufen können
    ALIASES leeren FOR zif_bv_gefaess~leeren.
    ALIASES get_fuellmenge FOR zif_bv_gefaess~get_fuellmenge.

    METHODS constructor IMPORTING io_getraenk TYPE REF TO zbv_getraenk.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: mo_getraenk TYPE REF TO zbv_getraenk.


ENDCLASS.



CLASS zbv_glas IMPLEMENTATION.

  METHOD constructor.
    mo_getraenk = io_getraenk.
  ENDMETHOD.

  METHOD zif_bv_gefaess~fuellen.
    mo_getraenk->erhoehte_menge( iv_erhoehte_menge = iv_fuellen ).
    WRITE: 'Füllmenge: ', iv_fuellen.
  ENDMETHOD.

  METHOD zif_bv_gefaess~get_fuellmenge.
    rv_fuellmenge = mo_getraenk->get_menge(  ).
  ENDMETHOD.

  METHOD zif_bv_gefaess~leeren.
    mo_getraenk->reduzierte_menge( iv_reduzierte_menge = iv_leeren ).
    WRITE: /'Leermenge: ', iv_leeren.
  ENDMETHOD.

ENDCLASS.
