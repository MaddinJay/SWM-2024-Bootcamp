*&---------------------------------------------------------------------*
*& Report z2lllvvbc401_main
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z2lllvvbc401_main.

CLASS lcl_airplane DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_name TYPE string
                                 iv_planetype TYPE saplane-planetype,
             display_attributes,
             display_n_o_airplanes,
             get_n_o_airplanes
               RETURNING VALUE(rv_count) TYPE i.
  PRIVATE SECTION.
    DATA: mv_name TYPE string,
          mv_planetype TYPE saplane-planetype.
    CLASS-DATA gv_n_o_airplanes TYPE i.
ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.
  METHOD constructor.
    mv_name = iv_name.
    mv_planetype = iv_planetype.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE: / 'Airplane Name:', mv_name,
           / 'Planetype:', mv_planetype.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: / 'Number of Airplanes:', gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplanes.
    rv_count = gv_n_o_airplanes.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA: gv_airplane TYPE REF TO lcl_airplane,
        gv_number_of_airplanes TYPE i.

  gv_airplane = NEW #( iv_name = 'Airbus' iv_planetype = 'Boing 747' ).

  gv_airplane->display_attributes( ).
  gv_airplane->display_n_o_airplanes( ).

  gv_number_of_airplanes = gv_airplane->get_n_o_airplanes( ).
  WRITE: / 'Number of Airplanes (via method):', gv_number_of_airplanes.

END-OF-SELECTION.
