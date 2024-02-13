CLASS zcl_tl_getraenk DEFINITION
  PUBLIC
  CREATE PUBLIC .
  "Vererbung ist zw. getränk und gin bzw. getränk und wasser.
  PUBLIC SECTION.

    METHODS constructor.
    METHODS reduzierte_menge IMPORTING iv_reduzierte_menge TYPE int1.

    METHODS erhoehte_menge IMPORTING iv_erhoehte_menge TYPE int1.

    METHODS get_menge RETURNING VALUE(rv_menge) TYPE int1.

  PROTECTED SECTION.
    DATA: mv_menge     TYPE int1,
          art_getraenk TYPE string.
  PRIVATE SECTION.



ENDCLASS.



CLASS zcl_tl_getraenk IMPLEMENTATION.
  METHOD erhoehte_menge.
    mv_menge = mv_menge + iv_erhoehte_menge.
  ENDMETHOD.

  METHOD get_menge.
    rv_menge = mv_menge.
  ENDMETHOD.

  METHOD reduzierte_menge.
    mv_menge = mv_menge - iv_reduzierte_menge.
  ENDMETHOD.


  METHOD constructor.
    mv_menge = 1. "Aufgabe: Bei der Instanziierung der Klasse soll die Füllmenge immer Default 1 sein.
  ENDMETHOD.

ENDCLASS.



