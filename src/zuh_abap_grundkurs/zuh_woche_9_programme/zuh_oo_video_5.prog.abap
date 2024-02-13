*&---------------------------------------------------------------------*
*& Report zuh_oo_video_5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_oo_video_5.

CLASS lcl_vehicle DEFINITION.

  PUBLIC SECTION.
    DATA mv_make TYPE string.
    METHODS: display_attributes.
    METHODS set_model IMPORTING iv_model TYPE string.
    METHODS get_model EXPORTING ev_model TYPE string.
    METHODS set_make IMPORTING iv_make TYPE string.
    METHODS get_make EXPORTING ev_make TYPE string.
    METHODS change_name CHANGING cv_name TYPE string.
    METHODS square IMPORTING iv_in  TYPE i
                   EXPORTING ev_out TYPE i.

    METHODS constructor IMPORTING iv_make  TYPE string
                                  iv_model TYPE string.

  PRIVATE SECTION.
    DATA mv_model TYPE string.
    METHODS hello_world.

ENDCLASS.

CLASS lcl_vehicle IMPLEMENTATION.


  METHOD constructor.
    mv_make = iv_make.
    mv_model = iv_model.
  ENDMETHOD.

  METHOD hello_world.
    WRITE / 'Hello World'.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE:/ 'Make :', mv_make,
          / 'Model:', mv_model.
  ENDMETHOD.

  METHOD set_model.
    mv_model = iv_model.
  ENDMETHOD.

  METHOD get_model.
    ev_model = mv_model.
  ENDMETHOD.

  METHOD change_name.
    cv_name = cv_name && cv_name.
  ENDMETHOD.

  METHOD get_make.
    ev_make = mv_make.
  ENDMETHOD.

  METHOD set_make.
    mv_make = iv_make.
  ENDMETHOD.

  METHOD square.
    ev_out = iv_in ** 2.
  ENDMETHOD.


ENDCLASS.

START-OF-SELECTION.

  DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
  DATA gr_vehic TYPE REF TO lcl_vehicle.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'VW'
      iv_model = 'Käfer'.
*  gr_vehic->set_make( iv_make = 'VW' ).
*  gr_vehic->set_model( iv_model = 'Käfer' ).
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'Mercedes'
      iv_model = '200D'.
*  gr_vehic->set_make( iv_make = 'Mercedes' ).
*  gr_vehic->set_model( iv_model = '200D' ).
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'Ford'
      iv_model = 'Taunus'.
*  gr_vehic->set_make( iv_make = 'Ford' ).
*  gr_vehic->set_model( iv_model = 'Taunus' ).
  APPEND gr_vehic TO grt_ref.


  LOOP AT grt_ref INTO gr_vehic
  WHERE table_line->mv_make = 'VW'.
    gr_vehic->display_attributes( ).
    ULINE.
  ENDLOOP.
