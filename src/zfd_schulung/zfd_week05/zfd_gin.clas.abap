CLASS zfd_gin DEFINITION INHERITING FROM zfd_getraenk
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: erhoehe_menge REDEFINITION.
    METHODS constructor IMPORTING iv_name type string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zfd_gin IMPLEMENTATION.
  METHOD erhoehe_menge.
     mv_fuellmenge = mv_fuellmenge + iv_getraenk_menge1 / 2.
  ENDMETHOD.
  METHOD constructor.

    super->constructor( iv_getraenk_name = iv_name ).

  ENDMETHOD.

ENDCLASS.
