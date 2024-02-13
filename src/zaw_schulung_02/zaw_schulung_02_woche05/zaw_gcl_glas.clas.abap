CLASS zaw_gcl_glas DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: zaw_yif_gefaess.
    ALIASES fuellen FOR zaw_yif_gefaess~fuellen.
    ALIASES leeren FOR zaw_yif_gefaess~leeren.
    ALIASES get_fuellmenge FOR zaw_yif_gefaess~get_fuellmenge.

    METHODS:      constructor IMPORTING io_getraenk TYPE REF TO zaw_gcl_getraenk.      " -> Konstruktur-Methode


  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA mv_getraenk TYPE REF TO zaw_gcl_getraenk.                         " -> Erzeugung einer Objektreferenz

ENDCLASS.


CLASS zaw_gcl_glas IMPLEMENTATION.

  METHOD constructor.                                                   " -> Zuweisung von Anfangswerten für die Referenzvariable durch den Konstruktur
    mv_getraenk = io_getraenk.
  ENDMETHOD.

  METHOD zaw_yif_gefaess~fuellen.
    mv_getraenk->erhoehe_menge( iv_getraenk_menge = iv_fuellmenge ).     " -> Aufruf der Methode aus der Klasse zaw_gcl_getraenk mit der Referenzvariablen
  ENDMETHOD.

  METHOD zaw_yif_gefaess~get_fuellmenge.
    rv_menge = mv_getraenk->get_menge(  ).                              " -> Aufruf der Methode aus der Klasse zaw_gcl_getraenk mit der Referenzvariablen
  ENDMETHOD.

  METHOD zaw_yif_gefaess~leeren.
    mv_getraenk->reduziere_menge( iv_weniger_menge = iv_leermenge ).    " -> Aufruf der Methode aus der Klasse zaw_gcl_getraenk mit der Referenzvariablen
  ENDMETHOD.

ENDCLASS.


