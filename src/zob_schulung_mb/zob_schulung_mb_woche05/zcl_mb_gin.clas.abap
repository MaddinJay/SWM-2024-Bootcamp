CLASS zcl_mb_gin DEFINITION
  PUBLIC
  INHERITING FROM zcl_mb_getraenk
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    METHODS: erhoeheMenge REDEFINITION.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mb_gin IMPLEMENTATION.


    METHOD erhoehemenge.
  mv_menge = mv_menge + ( iv_menge / 2 ).


      endmethod.

ENDCLASS.



