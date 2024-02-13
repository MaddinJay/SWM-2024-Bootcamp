CLASS zcl_mj_gin DEFINITION
  PUBLIC
  INHERITING FROM zcl_mj_getraenk
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS erhoehe_menge REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mj_gin IMPLEMENTATION.
  METHOD erhoehe_menge.
    mv_menge = mv_menge + ( iv_getraenk_menge / 2 ).
  ENDMETHOD.

ENDCLASS.
