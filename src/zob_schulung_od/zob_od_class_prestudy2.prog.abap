*&---------------------------------------------------------------------*
*& Report ZOB_OD_CLASS_PRESTUDY2
*&---------------------------------------------------------------------*
REPORT zob_od_class_prestudy2.

CLASS lcl_vehicle DEFINITION.
  PUBLIC SECTION.
    DATA: mv_make  TYPE string.
    METHODS display_attributes.
    METHODS set_model IMPORTING iv_model TYPE string.
    METHODS get_model EXPORTING ev_model TYPE string.
    METHODS change_name CHANGING cg_name TYPE string.

  PRIVATE SECTION.
    METHODS hello_world.
    DATA mv_model TYPE string.
ENDCLASS.

CLASS lcl_vehicle IMPLEMENTATION.
  METHOD hello_world.
    WRITE 'hello_world'.
  ENDMETHOD.
  METHOD display_attributes.
    WRITE : / 'Make :' , mv_make
           ,/ 'Model:', mv_model.
  ENDMETHOD.
  METHOD set_model.
    mv_model = iv_model.

  ENDMETHOD.

  METHOD get_model.
    ev_model = mv_model.
  ENDMETHOD.

  METHOD change_name.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
  DATA: gr_vehic  TYPE REF TO lcl_vehicle.
  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'VW'.
  gr_vehic->set_model( iv_model ='Käfer' ).
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'Mercedes'.
  gr_vehic->set_model( iv_model ='200 D' ).
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'Ford'.
  gr_vehic->set_model( iv_model ='Taunus' ).
  APPEND gr_vehic TO grt_ref.

*LOOP AT grt_ref into gr_vehic from 2 to 3.
*gr_vehic->display_attributes(  ).
*ENDLOOP.
LOOP AT grt_ref into gr_vehic WHERE TABLE_LINE->mv_make = 'VW'.
gr_vehic->display_attributes(  ).
ENDLOOP.


END-OF-SELECTION.
