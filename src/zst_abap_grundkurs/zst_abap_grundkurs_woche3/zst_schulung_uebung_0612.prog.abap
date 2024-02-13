*&---------------------------------------------------------------------*
*& Report zst_schulung_uebung_0612
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_schulung_uebung_0612.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS:
      set_airplane_name IMPORTING iv_name TYPE string,
      set_planetype IMPORTING iv_planetype TYPE saplane-planetype,
      display_attributes EXPORTING
                           ev_name      TYPE string
                           ev_planetype TYPE saplane-planetype.



    CLASS-METHODS:
      display_n_o_airplanes,
      get_n_o_airplanes RETURNING VALUE(rv_count) TYPE i, "Wird bei funktionalen Methoden verwendet
      get_n_o_airplanes_exp EXPORTING ev_count TYPE i. "Zur Veranschaulichung exporting

  PRIVATE SECTION.
    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype.


    CLASS-DATA: gv_n_o_airplanes TYPE i.

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
    WRITE: / icon_green_light, / 'Airplane Name:', ev_name, / 'Planeype: ', ev_planetype.
*    WRITE: / 'Airplane Name: ', mv_name.
*    WRITE: / 'Planeype: ', mv_planetype. "Alternative zum Export
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: / 'Number of Airplanes: ', gv_n_o_airplanes.

  ENDMETHOD.



  METHOD get_n_o_airplanes.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    rv_count = gv_n_o_airplanes.

  ENDMETHOD.

  METHOD get_n_o_airplanes_exp.
  gv_n_o_airplanes = gv_n_o_airplanes + 1.
    ev_count = gv_n_o_airplanes.

  ENDMETHOD.

ENDCLASS.

DATA:
  go_airplane TYPE REF TO lcl_airplane,
  gt_airplane TYPE TABLE OF REF TO lcl_airplane.


START-OF-SELECTION.
*  CREATE OBJECT go_airplane.
*  APPEND go_airplane TO gt_airplane.
*
*  CREATE OBJECT go_airplane.
*  APPEND go_airplane TO gt_airplane. "alte Schreibweise

  lcl_airplane=>display_n_o_airplanes( ).

  go_airplane = NEW #( ). "neue Schreibweise

  lcl_airplane=>display_n_o_airplanes( ).

  go_airplane->set_airplane_name( iv_name = 'Airbus' ).
  go_airplane->set_planetype( iv_planetype = 'Boing 747' ).


  go_airplane->display_attributes(  ).

  DATA gv_number_of_airplanes TYPE i.

  gv_number_of_airplanes = go_airplane->get_n_o_airplanes( ).

  WRITE: /'Counter ist gleich: ', gv_number_of_airplanes.

  go_airplane->get_n_o_airplanes_exp(
    IMPORTING
      ev_count = gv_number_of_airplanes
  ).

  WRITE: /'Counter ist gleich: ', gv_number_of_airplanes.
