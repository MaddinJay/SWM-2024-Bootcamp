*&---------------------------------------------------------------------*
*& Report zob_od_class_prestudy3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_class_prestudy3.
CLASS lcl_vehicle DEFINITION.
  PUBLIC SECTION.
    DATA: mv_make  TYPE string READ-ONLY.
    METHODS display_attributes.
    METHODS set_model IMPORTING iv_model TYPE string.
    METHODS set_make IMPORTING iv_make TYPE string.
    METHODS get_model EXPORTING ev_model TYPE string.
    METHODS get_make EXPORTING ev_make TYPE string.
    METHODS change_name CHANGING cv_name TYPE string.
    METHODS square IMPORTING iv_in         TYPE i
                   RETURNING VALUE(rv_out) TYPE i.
    METHODS constructor IMPORTING iv_make  TYPE string
                                  iv_model TYPE string.
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

  METHOD change_name.
    cv_name = cv_name && cv_name.
  ENDMETHOD.

  METHOD square.
    rv_out = iv_in ** 2.
  ENDMETHOD.

  METHOD constructor.
me->mv_make = iv_make.
me->mv_model = iv_make.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
  DATA: gr_vehic  TYPE REF TO lcl_vehicle.
  CREATE OBJECT gr_vehic
  exporting iv_make = 'VW'
            iv_model = 'Käfer'.
*  gr_vehic->set_make( iv_make ='VW' ).
*  gr_vehic->set_model( iv_model ='Käfer' ).
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
  exporting iv_make = 'Mercedes'
            iv_model = '200 D'.
*  gr_vehic->set_make( iv_make ='Mercedes' ).
*  gr_vehic->set_model( iv_model ='200 D' ).
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
  exporting iv_make = 'Ford'
            iv_model = 'Taunus'.
*  gr_vehic->set_make( iv_make ='Ford' ).
*  gr_vehic->set_model( iv_model ='Taunus' ).
  APPEND gr_vehic TO grt_ref.

*LOOP AT grt_ref into gr_vehic from 2 to 3.
*gr_vehic->display_attributes(  ).
*ENDLOOP.
  LOOP AT grt_ref INTO gr_vehic.
    gr_vehic->display_attributes(  ).
    ULINE.
  ENDLOOP.

*  DATA gv_ergebnis TYPE i.
*  gv_ergebnis = gr_vehic->square( iv_in = 4 ).
*  IF gv_ergebnis => 4.
*    WRITE gv_ergebnis.
*  ENDIF.

END-OF-SELECTION.
