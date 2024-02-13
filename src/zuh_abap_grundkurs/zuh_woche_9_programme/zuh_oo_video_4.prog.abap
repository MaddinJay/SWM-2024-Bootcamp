*&---------------------------------------------------------------------*
*& Report zuh_oo_video_4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_oo_video_4.

CLASS lcl_vehicle DEFINITION.

  PUBLIC SECTION.
    DATA mv_make TYPE string.
    METHODS: display_attributes.
    METHODS set_model IMPORTING iv_model TYPE string.
    METHODS get_model EXPORTING ev_model TYPE string.
    METHODS change_name CHANGING cv_name TYPE string.

  PRIVATE SECTION.
    DATA mv_model TYPE string.
    METHODS hello_world.

ENDCLASS.

CLASS lcl_vehicle IMPLEMENTATION.

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

ENDCLASS.

START-OF-SELECTION.

  DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
  DATA gr_vehic TYPE REF TO lcl_vehicle.

  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'VW'.
  gr_vehic->set_model( iv_model = 'Käfer' ).
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'Mercedes'.
  gr_vehic->set_model( iv_model = '200D' ).
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'Ford'.
  gr_vehic->set_model( iv_model = 'Taunus' ).
  APPEND gr_vehic TO grt_ref.

  LOOP AT grt_ref INTO gr_vehic FROM 2 TO 2.
    gr_vehic->display_attributes( ).
    ULINE.
  ENDLOOP.

    LOOP AT grt_ref INTO gr_vehic
    WHERE table_line->mv_make = 'VW'.
      gr_vehic->display_attributes( ).
      ULINE.
    ENDLOOP.
