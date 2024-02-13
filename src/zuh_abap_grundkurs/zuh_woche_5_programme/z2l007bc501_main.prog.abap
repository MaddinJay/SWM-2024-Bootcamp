*&---------------------------------------------------------------------*
*& Report z2l007bc501_main
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z2l007bc501_main.

TYPE-POOLS icon.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.

    METHODS set_airplane_name   IMPORTING iv_name TYPE string.

    METHODS set_planetype       IMPORTING iv_planetype TYPE saplane-planetype.

    METHODS Display_attributes EXPORTING ev_name      TYPE string
                                         ev_planetype TYPE saplane-planetype.

    CLASS-METHODS display_n_o_airplanes.

    METHODS get_n_o_airplanes RETURNING VALUE(rv_count) TYPE i.

  PRIVATE SECTION.

    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype.

    CLASS-DATA: gv_n_o_airplanes TYPE i VALUE 1.

ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD set_airplane_name.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD set_planetype.
    mv_planetype = iv_planetype.
  ENDMETHOD.

  METHOD display_attributes.
    ev_name = mv_name.
    ev_planetype = mv_planetype.
    WRITE: /, 'Flugzeugname', mv_name, 'Type', mv_planetype.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: /, 'Display Airplane', gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplanes.
    rv_count = gv_n_o_airplanes.
    rv_count = rv_count + 1.
    WRITE: /, 'Flugzeit', rv_count.
  ENDMETHOD.


ENDCLASS.

START-OF-SELECTION.

  DATA: go_airplane           TYPE REF TO lcl_airplane,
        gt_airplane           TYPE TABLE OF REF TO lcl_airplane,
        gv_number_of_airplane TYPE i.


  lcl_airplane=>display_n_o_airplanes( ).

  go_airplane = NEW #( ).

  lcl_airplane=>display_n_o_airplanes( ).


  go_airplane->set_airplane_name( iv_name = 'A-747' ).
  go_airplane->set_planetype( iv_planetype = 'Airbus' ).

  go_airplane->display_attributes( ).

  go_airplane->display_n_o_airplanes( ).

  go_airplane->get_n_o_airplanes( ).

  gv_number_of_airplane = go_airplane->get_n_o_airplanes( ).


  WRITE: 'Counter ist gleich:', gv_number_of_airplane.
