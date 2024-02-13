CLASS ztw_getraenk_gin DEFINITION
PUBLIC INHERITING FROM ztw_getraenk.


  PUBLIC SECTION.

   METHODS erhoehe_menge REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztw_getraenk_gin IMPLEMENTATION.
 METHOD erhoehe_menge.
    mv_menge = mv_menge + ( iv_getraenk_menge / 2 ).
  ENDMETHOD.

ENDCLASS.
