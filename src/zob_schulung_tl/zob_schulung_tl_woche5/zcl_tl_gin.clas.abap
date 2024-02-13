CLASS zcl_tl_gin DEFINITION
  PUBLIC
  INHERITING FROM zcl_tl_getraenk

  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS erhoehte_menge REDEFINITION. "Redefiniert eine Methode

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tl_gin IMPLEMENTATION.

  METHOD erhoehte_menge.
    mv_menge = mv_menge + ( iv_erhoehte_menge / 2 ).
  ENDMETHOD.

ENDCLASS.
