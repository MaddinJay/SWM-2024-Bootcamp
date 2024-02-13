CLASS zlv_wasser DEFINITION
  PUBLIC
  INHERITING FROM zcl_lv_getraenk

  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS erhoehte_menge REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zlv_wasser IMPLEMENTATION.
  METHOD erhoehte_menge.
    mv_menge = 1.
    mv_menge = mv_menge + iv_getranke_menge2.
  ENDMETHOD.
ENDCLASS.
