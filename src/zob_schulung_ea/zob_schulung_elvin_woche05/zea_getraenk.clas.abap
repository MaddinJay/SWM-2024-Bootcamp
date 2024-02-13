CLASS zea_getraenk DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
     METHODS reduzierte_menge IMPORTING iv_reduzierte_menge TYPE i.

     METHODS erhoete_menge     IMPORTING iv_erhoete_menge    TYPE i.

     METHODS get_menge         RETURNING VALUE(rv_menge) TYPE i.


  PROTECTED SECTION.
       DATA: mv_menge        TYPE i,
             art_getraenk TYPE string.
  PRIVATE SECTION.

ENDCLASS.



CLASS zea_getraenk IMPLEMENTATION.
  METHOD erhoete_menge.
      mv_menge = mv_menge + iv_erhoete_menge.
  ENDMETHOD.

  METHOD get_menge.
        rv_menge = mv_menge.
  ENDMETHOD.

  METHOD reduzierte_menge.
      mv_menge = mv_menge - iv_reduzierte_menge.
  ENDMETHOD.

ENDCLASS.
