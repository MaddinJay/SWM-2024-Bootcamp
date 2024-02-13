CLASS zea_gin DEFINITION
  PUBLIC
  INHERITING FROM zea_getraenk
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS erhoete_menge REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zea_gin IMPLEMENTATION.

METHOD erhoete_menge.
    mv_menge = ( mv_menge + iv_erhoete_menge ) / 2.
    WRITE mv_menge.
ENDMETHOD.

ENDCLASS.
