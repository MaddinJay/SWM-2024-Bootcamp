CLASS zaw_gcl_wasser DEFINITION INHERITING FROM zaw_gcl_getraenk
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS erhoehe_menge REDEFINITION.
    methods constructor IMPORTING iv_name TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zaw_gcl_wasser IMPLEMENTATION.

  METHOD erhoehe_menge.
    mv_menge = mv_menge + iv_getraenk_menge * 5.
  ENDMETHOD.

  METHOD constructor.

    super->constructor( iv_name = iv_name ).
    mv_menge = mv_menge + 2.

  ENDMETHOD.
ENDCLASS.



