CLASS zob_od_lcl_gin DEFINITION INHERITING FROM zob_od_getraenk_class
PUBLIC
  CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS erhoehe_menge REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zob_od_lcl_gin IMPLEMENTATION.
  METHOD erhoehe_menge.
    mv_menge = mv_menge + ( iv_getraenk_menge / 2 ).
  ENDMETHOD.

ENDCLASS.
