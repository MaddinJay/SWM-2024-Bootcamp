CLASS zcl_hum_wasser DEFINITION
  PUBLIC
  INHERITING FROM zcl_hum_getraenk
  CREATE PUBLIC .

  PUBLIC SECTION.
  methods constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_hum_wasser IMPLEMENTATION.
  METHOD constructor.
  call method super->constructor.
  mv_menge = ( mv_menge + 2 ).
 ENDMETHOD.
ENDCLASS.
