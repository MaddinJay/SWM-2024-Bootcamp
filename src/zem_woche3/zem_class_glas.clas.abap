CLASS zem_class_glas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

INTERFACES: zem_interface_getraenk.

  METHODS constructor IMPORTING io_getraenk TYPE REF TO zem_class_getraenk.

*  METHODS fuellen IMPORTING iv_fuellen TYPE int1.
*
*  METHODS leeren IMPORTING iv_leeren TYPE int1.
*
*  METHODS get_fuellmenge RETURNING VALUE(rv_fuellmenge) TYPE int1.



  PROTECTED SECTION.
  PRIVATE SECTION.

  DATA: mo_getraenk TYPE REF TO zEM_CLASS_getraenk.


ENDCLASS.



CLASS zem_class_glas IMPLEMENTATION.

  METHOD constructor.
     mo_getraenk = io_getraenk.
  ENDMETHOD.



  METHOD zem_interface_getraenk~fuellen.

 mo_getraenk->erhoehte_menge( iv_erhoehte_menge = iv_fuellen ).
 WRITE: 'Füllmenge: ', iv_fuellen.

  ENDMETHOD.

  METHOD zem_interface_getraenk~get_fuellmenge.

    rv_fuellmenge = mo_getraenk->get_menge(  ).

  ENDMETHOD.

  METHOD zem_interface_getraenk~leeren.

  mo_getraenk->reduzierte_menge( iv_reduzierte_menge = iv_leeren ).
    WRITE: /'Leermenge: ', iv_leeren.

  ENDMETHOD.

ENDCLASS.
