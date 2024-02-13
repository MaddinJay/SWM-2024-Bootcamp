CLASS zfd_wasser DEFINITION INHERITING FROM zfd_getraenk
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: erhoehe_menge REDEFINITION.
    methods: constructor importing iv_name type string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zfd_wasser IMPLEMENTATION.
  METHOD erhoehe_menge.
     mv_fuellmenge = mv_fuellmenge + iv_getraenk_menge1 * 5.
  ENDMETHOD.
  METHOD constructor.

    super->constructor( iv_getraenk_name = iv_name ).
    mv_fuellmenge = mv_fuellmenge + 2.

  ENDMETHOD.

ENDCLASS.
