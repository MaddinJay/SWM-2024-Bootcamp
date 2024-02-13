*&---------------------------------------------------------------------*
*& Report ztw_klassen_uebung_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_klassen_uebung_1. "Da wir die Klasse im Report anlegen, ist es eine Lokale Klasse. ->

**********************************************************************
* Attribute
**********************************************************************

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS set_airplane_name IMPORTING iv_name      TYPE string.
    METHODS set_planetype     IMPORTING iv_planetype TYPE saplane-planetype.

    METHODS display_attributes.

    CLASS-METHODS display_n_o_airplanes.
    CLASS-METHODS get_n_o_airplanes RETURNING VALUE(rv_count) TYPE i.
    CLASS-METHODS get_n_o_airplanes_exp EXPORTING ev_count TYPE i.

  PRIVATE SECTION.
    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype.

    CLASS-DATA: gv_n_o_airplanes TYPE i.

ENDCLASS.

**********************************************************************
* Methoden
**********************************************************************

CLASS lcl_airplane IMPLEMENTATION.

  METHOD set_airplane_name.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD set_planetype.
    mv_planetype = iv_planetype. "iv =Import Variable / ev = Export Variable
  ENDMETHOD.

  METHOD display_attributes.
    WRITE: /'Airplane Name: ', mv_name.
    WRITE: /'Planetype: ', mv_planetype.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: /'Number of Airplanes: ', gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplanes.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    rv_count = gv_n_o_airplanes. "rv = Return Variable
  ENDMETHOD.

  METHOD get_n_o_airplanes_exp.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    ev_count = gv_n_o_airplanes.
  ENDMETHOD.

ENDCLASS.



START-OF-SELECTION.

  DATA go_airplane TYPE REF TO lcl_airplane.

  lcl_airplane=>display_n_o_airplanes( ).
  go_airplane = NEW #( ).
  lcl_airplane=>display_n_o_airplanes( ).

  go_airplane->set_airplane_name( EXPORTING iv_name = 'Airbus' ).
  go_airplane->set_planetype( iv_planetype = 'Boing 787' ).

  go_airplane->display_attributes( ).

  DATA gv_number_of_airplanes TYPE i.

  gv_number_of_airplanes = go_airplane->get_n_o_airplanes( ).

  WRITE: /'Counter ist gleich: ' , gv_number_of_airplanes.

  go_airplane->get_n_o_airplanes_exp( IMPORTING ev_count = gv_number_of_airplanes ).

  WRITE: /'Counter ist gleich: ' , gv_number_of_airplanes.
