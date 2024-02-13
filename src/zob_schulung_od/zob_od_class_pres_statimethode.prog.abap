*&---------------------------------------------------------------------*
*& Report zob_od_class_pres_statimethode
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_class_pres_statimethode.
CLASS lcl_vehicle DEFINITION.
  PUBLIC SECTION.
    DATA: mv_make  TYPE string READ-ONLY.
    CLASS-DATA kv_counter TYPE i.
    METHODS display_attributes.
    METHODS set_model IMPORTING iv_model TYPE string.
    METHODS set_make IMPORTING iv_make TYPE string.
    METHODS get_model EXPORTING ev_model TYPE string.
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
  METHOD display_attributes.
    WRITE : / 'Make :' , mv_make
           ,/ 'Model:', mv_model.
  ENDMETHOD.
  METHOD set_model.
    me->mv_model = iv_model.

  ENDMETHOD.
  METHOD set_make.
    me->mv_make = iv_make.
  ENDMETHOD.

  METHOD get_model.
    ev_model = me->mv_model.
  ENDMETHOD.
  METHOD get_make.
    ev_make = me->mv_make.
  ENDMETHOD.

  METHOD constructor.
    me->mv_make = iv_make.
    me->mv_model = iv_model.
    kv_counter = kv_counter + 1.
  ENDMETHOD.

  METHOD hello_world.
    WRITE 'hello_world'.
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
  DATA: gr_vehic  TYPE REF TO lcl_vehicle.
  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'VW'
      iv_model = 'Käfer'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'Mercedes'
      iv_model = '200 D'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'Ford'
      iv_model = 'Taunus'.
  APPEND gr_vehic TO grt_ref.

  LOOP AT grt_ref INTO gr_vehic WHERE table_line->mv_make = 'Ford'.
    gr_vehic->display_attributes(  ).
    ULINE.
  ENDLOOP.
  lcl_vehicle=>kv_counter = 42.

  DATA gv_zahl TYPE i.
  gv_zahl = lcl_vehicle=>get_counter(  ).
WRITE gv_zahl.
END-OF-SELECTION.
