CLASS zea_glas DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES: zif_ea_gefaess.

  METHODS constructor IMPORTING io_getraenk TYPE REF TO zea_getraenk.


  PROTECTED SECTION.
  PRIVATE SECTION.

  DATA: mv_getraenk TYPE REF TO zea_getraenk.

ENDCLASS.

CLASS zea_glas IMPLEMENTATION.

 METHOD constructor.
  mv_getraenk = NEW #( ).
  mv_getraenk = io_getraenk.
 ENDMETHOD.

  METHOD zif_ea_gefaess~fuellen.
 mv_getraenk->erhoete_menge( iv_erhoete_menge = iv_fuellen ).
    WRITE: / 'Füllmenge', iv_fuellen.
  ENDMETHOD.

  METHOD zif_ea_gefaess~get_fuellmenge.
 rv_fuellmenge = mv_getraenk->get_menge( ).
  ENDMETHOD.

  METHOD zif_ea_gefaess~leeren.
   mv_getraenk->reduzierte_menge( iv_reduzierte_menge = iv_leeren ).
   WRITE: / 'Leermenge', iv_leeren.
  ENDMETHOD.

ENDCLASS.
