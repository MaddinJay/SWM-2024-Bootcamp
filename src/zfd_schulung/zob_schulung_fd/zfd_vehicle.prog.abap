*&---------------------------------------------------------------------*
*& Include          ZFD_VEHICLE
*&---------------------------------------------------------------------*

CLASS lcl_vehicle DEFINITION.
  PUBLIC SECTION.
    DATA mv_make TYPE string READ-ONLY.
    METHODS display_attributes.
    METHODS set_model IMPORTING iv_model TYPE string.
    METHODS get_model RETURNING VALUE(rv_model) TYPE string.
    METHODS set_make IMPORTING iv_make TYPE string.
    METHODS get_make EXPORTING ev_make TYPE string.
    METHODS constructor IMPORTING iv_make  TYPE string
                                  iv_model TYPE string.
    CLASS-METHODS get_counter RETURNING VALUE(rv_counter) TYPE i.
    CLASS-METHODS class_constructor.

    METHODS estimate_fuel IMPORTING iv_dist TYPE i
    returning Value(rv_fuel) type i.

  PROTECTED SECTION.
    DATA mv_model TYPE string.

  PRIVATE SECTION.
    METHODS hello_world.
    CLASS-DATA kv_counter TYPE i.

ENDCLASS.

CLASS lcl_vehicle IMPLEMENTATION.
  METHOD class_constructor.
    kv_counter = 10.
  ENDMETHOD.

  METHOD constructor.
    me->mv_make = iv_make.
    me->mv_model = iv_model.
    kv_counter = kv_counter + 1.
  ENDMETHOD.

  METHOD hello_world.
    WRITE / 'Hello World'.
  ENDMETHOD.

  METHOD display_attributes.
    DATA lv_text TYPE string.
    lv_text = 'Hugo'.
    me->hello_world( ).
    WRITE:/ 'Make : ', me->mv_make.
    WRITE:/ 'Modell : ', me->mv_model.
  ENDMETHOD.

  METHOD set_model.
    me->mv_model = iv_model.
  ENDMETHOD.

  METHOD get_model.
    rv_model = me->mv_model.
  ENDMETHOD.

  METHOD set_make.
    me->mv_make = iv_make.
  ENDMETHOD.

  METHOD get_make.
    ev_make = me->mv_make.
  ENDMETHOD.

  METHOD get_counter.
    rv_counter = kv_counter.
  ENDMETHOD.

  METHOD estimate_fuel.

  ENDMETHOD.

ENDCLASS.
