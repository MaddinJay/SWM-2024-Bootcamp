CLASS zcl_mb_wasser DEFINITION
  PUBLIC
  INHERITING FROM zcl_mb_getraenk
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  Methods constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mb_wasser IMPLEMENTATION.
  METHOD constructor.

    super->constructor( ).
    mv_menge = mv_menge + 2.

  ENDMETHOD.

ENDCLASS.
