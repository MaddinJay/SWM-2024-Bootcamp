*&---------------------------------------------------------------------*
*& Report ztw_oo_methods_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_oo_methods_2.
**********************************************************************
*Klassendefinition
CLASS lcl_vehicle DEFINITION.

  PUBLIC SECTION.
    DATA mv_make TYPE string READ-ONLY.
    CLASS-DATA kv_counter TYPE i.
    METHODS display_attributes.
    METHODS set_model IMPORTING iv_model TYPE string.
    METHODS get_model EXPORTING ev_model TYPE string.
    METHODS set_make IMPORTING iv_make TYPE string.
    METHODS get_make EXPORTING ev_make TYPE string.
    METHODS constructor IMPORTING iv_make  TYPE string
                                  iv_model TYPE string.
    CLASS-METHODS get_counter RETURNING VALUE(rv_counter) TYPE i.

  PRIVATE SECTION.
    DATA mv_model TYPE string.
    METHODS hello_world.

ENDCLASS.
**********************************************************************
*Klassenimplementierung
CLASS lcl_vehicle IMPLEMENTATION.

  METHOD constructor. "Man spart sich die einzelenen Schritte mit Set und Get
    me->mv_make = iv_make.
    me->mv_model = iv_model.
    kv_counter = kv_counter + 1.
  ENDMETHOD.

  METHOD hello_world.
    WRITE / 'Hello World'.
  ENDMETHOD.

  METHOD display_attributes.
    DATA lv_text TYPE String.
    lv_text = 'Hugo'.
    WRITE: /,'Make: ', me->mv_make.
    WRITE: /,'Model: ', me->mv_model.
  ENDMETHOD.

  METHOD set_model.
    me->mv_model = iv_model.
  ENDMETHOD.

  METHOD get_model.
    me->mv_make = ev_model.
  ENDMETHOD.

  METHOD set_make.
    me->mv_make = iv_make.
  ENDMETHOD.

  METHOD get_make.
    me->mv_make = ev_make.
  ENDMETHOD.

  METHOD get_counter.
    rv_counter = kv_counter.
  ENDMETHOD.

ENDCLASS.

**********************************************************************
*Anwedung des Codes

START-OF-SELECTION.
  DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
  DATA gr_vehic TYPE REF TO lcl_vehicle.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'VW'
      iv_model = 'Arteon'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'Mercedes'
      iv_model = 'S-Klasse'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'Audi'
      iv_model = 'Q5'.
  APPEND gr_vehic TO grt_ref.

  LOOP AT grt_ref INTO gr_vehic
  WHERE table_line->mv_make = 'Mercedes'.
    gr_vehic->display_attributes(  ).
    ULINE.
  ENDLOOP.

  lcl_vehicle=>kv_counter = 42.

  DATA gv_anzahl type i.
  lcl_vehicle=>get_counter(  ).

gr_vehic->kv_counter = 43.

  break-point.
