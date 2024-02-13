*&---------------------------------------------------------------------*
*& Report zod_bc401_main
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_bc401_main.

CLASS lcl_airplane DEFINITION.
  PUBLIC SECTION.

    METHODS set_airplane_name
      IMPORTING iv_name TYPE String.
    METHODS set_plantype
      IMPORTING iv_planetype TYPE saplane-planetype.

    METHODS: display_attributes
      EXPORTING
        iv_name      TYPE String
        iv_planetype TYPE saplane-planetype.
    CLASS-METHODS display_n_o_airplanes.

    CLASS-METHODS get_n_o_airplanes RETURNING VALUE(rv_count) TYPE i.


  PRIVATE SECTION.

    DATA: mv_name       TYPE string,
          mv_plane_type TYPE saplane-planetype.

    CLASS-DATA:   gv_n_o_airplanes TYPE i. "statische Variable

ENDCLASS.
CLASS lcl_airplane IMPLEMENTATION.
  METHOD set_airplane_name.
    mv_name = iv_name.

  ENDMETHOD.

  METHOD set_plantype.

    mv_plane_type = iv_planetype.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE: / 'Airplane name: ', mv_name.
    WRITE: / 'Planetyp: ', mv_plane_type.

  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: / 'Number of Airplanes: ' , gv_n_o_airplanes.

  ENDMETHOD.

  METHOD get_n_o_airplanes. "funktionelle Metode
    rv_count = gv_n_o_airplanes + 1.
    WRITE: / 'regreso', rv_count.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  DATA:
    go_airplane  TYPE REF TO lcl_airplane,
    gt_airplanes TYPE TABLE OF REF TO lcl_airplane.

  lcl_airplane=>display_n_o_airplanes(  ). "funktional
  lcl_airplane=>get_n_o_airplanes(  ).
  go_airplane = NEW #(  ). "gleich wie create object, neue schreibtweise
  go_airplane->set_airplane_name( EXPORTING iv_name = 'Airbus' ).
  go_airplane->set_plantype( iv_planetype = 'Boing 787' ).

*  APPEND go_airplane TO gt_airplanes.

  lcl_airplane=>display_n_o_airplanes(  ).

  DATA gv_nummber_of_airplanes TYPE i.
  gv_nummber_of_airplanes = go_airplane->get_n_o_airplanes( ).


*  CREATE OBJECT go_airplane.
*  APPEND go_airplane TO gt_airplanes.

  go_airplane->display_attributes( ). "Instanz methode aufrufen
  go_airplane->set_plantype( EXPORTING iv_planetype = 'planetype' ).


*cl_demo_output=>display( gt_airplanes ).
