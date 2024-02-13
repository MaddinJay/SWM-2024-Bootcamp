CLASS z_as_gin DEFINITION INHERITING FROM z_as_getraenk
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS erhoeheMenge REDEFINITION.

*    METHODS getGinMenge IMPORTING ginMenge TYPE i.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_as_gin IMPLEMENTATION.
  METHOD erhoehemenge.
    menge = menge + ( iv_getraenk_menge2 * '0.5' ).
  ENDMETHOD.




ENDCLASS.
