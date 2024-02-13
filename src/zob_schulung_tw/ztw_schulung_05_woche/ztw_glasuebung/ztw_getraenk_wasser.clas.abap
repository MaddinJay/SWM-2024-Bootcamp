CLASS ztw_getraenk_wasser DEFINITION
PUBLIC INHERITING FROM ztw_getraenk.


  PUBLIC SECTION.

    METHODS erhoehe_menge REDEFINITION.
    METHODS constructor.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztw_getraenk_wasser IMPLEMENTATION.
 METHOD erhoehe_menge.
    mv_menge = mv_menge + ( iv_getraenk_menge * 5 ).
  ENDMETHOD.

  METHOD constructor.

    super->constructor( ).
    mv_menge = mv_menge + 2.

  ENDMETHOD.

ENDCLASS.
