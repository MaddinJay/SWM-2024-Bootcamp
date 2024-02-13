CLASS zlv_uebung_gin DEFINITION
  PUBLIC
  INHERITING FROM zcl_lv_getraenk
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS gin.
  METHODS erhoehe_menge REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zlv_uebung_gin IMPLEMENTATION.
  METHOD erhoehe_menge.
mv_menge = mv_menge + iv_getraenk_menge / 2.
  ENDMETHOD.

  METHOD gin.

  ENDMETHOD.

ENDCLASS.
