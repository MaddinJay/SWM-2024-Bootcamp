CLASS zcl_bv_glas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING io_getraenk TYPE REF TO zbv_getraenk.

    METHODS fuellen IMPORTING iv_menge TYPE int1.
    METHODS leeren IMPORTING iv_menge TYPE int1.
    METHODS get_Menge RETURNING VALUE(rv_menge) TYPE int1.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA mo_getraenk TYPE REF TO zbv_getraenk.

ENDCLASS.



CLASS zcl_bv_glas IMPLEMENTATION.

  METHOD constructor.
    mo_getraenk = io_getraenk.
  ENDMETHOD.

  METHOD fuellen.

  ENDMETHOD.

  METHOD leeren.

  ENDMETHOD.

  METHOD get_menge.

  ENDMETHOD.



ENDCLASS.
