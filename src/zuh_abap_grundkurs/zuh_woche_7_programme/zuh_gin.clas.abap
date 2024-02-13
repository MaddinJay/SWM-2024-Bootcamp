CLASS zuh_gin DEFINITION
  PUBLIC
  INHERITING FROM zuh_getraenk_mg
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS erhoehe_menge REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zuh_gin IMPLEMENTATION.
  METHOD erhoehe_menge.
    mv_menge = mv_menge + iv_getraenk_menge.
  ENDMETHOD.

ENDCLASS.
