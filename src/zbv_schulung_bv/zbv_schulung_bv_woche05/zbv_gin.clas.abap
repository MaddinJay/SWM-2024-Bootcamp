CLASS zbv_gin DEFINITION
  PUBLIC
  INHERITING FROM zbv_getraenk
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS erhoehte_menge REDEFINITION. "Redefiniert eine Methode

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbv_gin IMPLEMENTATION.

  METHOD erhoehte_menge.
    mv_menge = mv_menge + ( iv_erhoehte_menge / 2 ).
  ENDMETHOD.

ENDCLASS.
