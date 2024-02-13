CLASS zuh_wasser DEFINITION
  PUBLIC
  INHERITING FROM zuh_getraenk_mg
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  methods constructor.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zuh_wasser IMPLEMENTATION.
  METHOD constructor.

    super->constructor( ).
    mv_menge = mv_menge + 2.

  ENDMETHOD.

ENDCLASS.
