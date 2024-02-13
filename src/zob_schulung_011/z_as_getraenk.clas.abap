CLASS z_as_getraenk DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor IMPORTING iv_name TYPE string.
    METHODS getName returning value(rv_name) TYPE string.
    METHODS reduziereMenge
      IMPORTING iv_getraenk_menge1 TYPE i.

    METHODS erhoeheMenge
      IMPORTING iv_getraenk_menge2 TYPE i.

    METHODS getMenge
      RETURNING VALUE(rv_menge) TYPE i.

  PROTECTED SECTION.
    DATA: menge        TYPE i,
          art_getraenk TYPE string,
          name         TYPE string.
  PRIVATE SECTION.


ENDCLASS.

CLASS z_as_getraenk IMPLEMENTATION.
  METHOD erhoehemenge.
    menge = menge + ( 2 * iv_getraenk_menge2 ).
  ENDMETHOD.

  METHOD getmenge.
    rv_menge = menge.
  ENDMETHOD.

  METHOD reduzieremenge.
    menge = menge - iv_getraenk_menge1.
  ENDMETHOD.

  METHOD constructor.
    menge = 1.
    name = iv_name.
  ENDMETHOD.

  METHOD getname.
  rv_name = name.
  ENDMETHOD.

ENDCLASS.
