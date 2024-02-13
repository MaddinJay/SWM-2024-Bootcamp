CLASS zcl_hum_gin DEFINITION
  PUBLIC
  INHERITING FROM zcl_hum_getraenk

  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS erhoehe_menge REDEFINITION.


  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hum_gin IMPLEMENTATION.
  METHOD erhoehe_menge.
    "bekommt die Menge von cl_glas übergeben
    mv_menge = mv_menge + ( iv_getraenk_menge / 2 ).

  ENDMETHOD.

ENDCLASS.
