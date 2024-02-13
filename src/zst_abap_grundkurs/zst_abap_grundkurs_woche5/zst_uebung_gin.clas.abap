CLASS zst_uebung_gin DEFINITION
  PUBLIC
  INHERITING FROM zst_uebung_getraenk
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS erhoehte_menge REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zst_uebung_gin IMPLEMENTATION.

  METHOD erhoehte_menge.
    mv_menge = ( mv_menge + iv_getraenk_menge ) / 2.
  ENDMETHOD.


ENDCLASS.
