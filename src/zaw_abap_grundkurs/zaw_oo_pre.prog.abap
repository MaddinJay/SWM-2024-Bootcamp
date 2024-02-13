*&---------------------------------------------------------------------*
*& Report ZAW_OO_PRE
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
REPORT zaw_oo_pre.

CLASS lcl_fahrzeug DEFINITION.

  PUBLIC SECTION.
    DATA mv_marke TYPE string.
    METHODS display_attributes.
    METHODS set_modell IMPORTING iv_modell TYPE string.
    METHODS get_modell EXPORTING ev_modell TYPE string.
    METHODS change_name CHANGING cv_name TYPE string.

  PRIVATE SECTION.
    DATA: mv_modell TYPE string.
    METHODS hello_world.

ENDCLASS.

CLASS lcl_fahrzeug IMPLEMENTATION.

  METHOD hello_world.
    WRITE / 'Hello World!'.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE: / 'Marke: ', mv_marke,
    / 'Modell: ', mv_modell.
  ENDMETHOD.

  METHOD set_modell.
    mv_modell = iv_modell.
  ENDMETHOD.

  METHOD get_modell.
    ev_modell = mv_modell.
  ENDMETHOD.

  METHOD change_name.
    cv_name = cv_name && cv_name.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_fahrzeug.
  DATA gr_ref TYPE REF TO lcl_fahrzeug.

  CREATE OBJECT gr_ref.
  gr_ref->mv_marke = 'VW'.
  gr_ref->set_modell( iv_modell = 'Käfer' ).
  APPEND gr_ref TO grt_ref.

  CREATE OBJECT gr_ref.
  gr_ref->mv_marke = 'Ford'.
  gr_ref->set_modell( iv_modell = 'Taunus' ).
  APPEND gr_ref TO grt_ref.

  CREATE OBJECT gr_ref.
  gr_ref->mv_marke = 'Seat'.
  gr_ref->set_modell( iv_modell = 'Leon' ).
  APPEND gr_ref TO grt_ref.

  LOOP AT grt_ref INTO gr_ref
    WHERE table_line->mv_marke = 'VW'.
    gr_ref->display_attributes( ).
    ULINE.
  ENDLOOP.
