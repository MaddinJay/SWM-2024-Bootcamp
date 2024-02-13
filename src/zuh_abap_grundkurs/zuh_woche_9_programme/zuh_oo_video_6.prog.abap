*&---------------------------------------------------------------------*
*& Report zuh_oo_video_6
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_oo_video_6.

CLASS lcl_vehicle DEFINITION.

  PUBLIC SECTION.
    DATA mv_make TYPE string.
    CLASS-DATA kv_counter TYPE i.
    METHODS: display_attributes.
    METHODS set_model IMPORTING iv_model TYPE string.
    METHODS get_model EXPORTING ev_model TYPE string.
    METHODS set_make IMPORTING iv_make TYPE string.
    METHODS get_make EXPORTING ev_make TYPE string.

    METHODS constructor IMPORTING iv_make  TYPE string
                                  iv_model TYPE string.

    CLASS-METHODS get_counter RETURNING VALUE(rv_counter) TYPE i.
    CLASS-METHODS class_constructor.

  PRIVATE SECTION.
    DATA mv_model TYPE string.
    METHODS hello_world.

ENDCLASS.

CLASS lcl_vehicle IMPLEMENTATION.


  METHOD constructor.
    mv_make = iv_make.
    mv_model = iv_model.
    kv_counter = kv_counter + 1.
  ENDMETHOD.

  METHOD hello_world.
    WRITE / 'Hello World'.
  ENDMETHOD.

  METHOD display_attributes.
    DATA lv_text TYPE string.
    lv_text = 'Hugo'.
    hello_world( ).
    WRITE:/ 'Make :', mv_make,
          / 'Model:', mv_model.
  ENDMETHOD.

  METHOD set_model.
    mv_model = iv_model.
  ENDMETHOD.

  METHOD get_model.
    ev_model = mv_model.
  ENDMETHOD.

  METHOD get_make.
    ev_make = mv_make.
  ENDMETHOD.

  METHOD set_make.
    mv_make = iv_make.
  ENDMETHOD.


  METHOD get_counter.
    rv_counter = kv_counter.
  ENDMETHOD.

  METHOD class_constructor.
    kv_counter = 10.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
  DATA gr_vehic TYPE REF TO lcl_vehicle.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'VW'
      iv_model = 'Käfer'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'Mercedes'
      iv_model = '200D'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'Ford'
      iv_model = 'Taunus'.
  APPEND gr_vehic TO grt_ref.


  LOOP AT grt_ref INTO gr_vehic
  WHERE table_line->mv_make = 'VW'.
    gr_vehic->display_attributes( ).
    ULINE.
  ENDLOOP.

  lcl_vehicle=>kv_counter = 42.

  DATA gv_anzahl TYPE i.
  gv_anzahl = lcl_vehicle=>get_counter( ).

  BREAK-POINT.
