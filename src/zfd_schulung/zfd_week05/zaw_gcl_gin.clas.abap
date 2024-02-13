CLASS zaw_gcl_gin DEFINITION INHERITING FROM zaw_gcl_getraenk
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS erhoehe_menge REDEFINITION.
    METHODS constructor IMPORTING iv_name TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zaw_gcl_gin IMPLEMENTATION.

  METHOD erhoehe_menge.
    mv_menge = mv_menge + iv_getraenk_menge / 2.
  ENDMETHOD.

  METHOD constructor.

    super->constructor( iv_name = iv_name ).   " -> Super-Konstruktor (aus Oberklasse) ruft den Konstruktor der Unterklasse auf.

  ENDMETHOD.

ENDCLASS.




