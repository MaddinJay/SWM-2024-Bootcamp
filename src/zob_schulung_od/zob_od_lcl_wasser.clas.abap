CLASS zob_od_lcl_wasser DEFINITION
  PUBLIC INHERITING FROM zob_od_getraenk_class.

  PUBLIC SECTION.

    METHODS erhoehe_menge REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zob_od_lcl_wasser IMPLEMENTATION.
METHOD erhoehe_menge.
  mv_menge = mv_menge + ( iv_getraenk_menge * 5 ).
  ENDMETHOD.
ENDCLASS.
