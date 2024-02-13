CLASS zst_uebung_wasser DEFINITION
  PUBLIC
  INHERITING FROM zst_uebung_getraenk
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zst_uebung_wasser IMPLEMENTATION.
  METHOD constructor.

    super->constructor( ).

    mv_menge = mv_menge + 2.

  ENDMETHOD.

ENDCLASS.
