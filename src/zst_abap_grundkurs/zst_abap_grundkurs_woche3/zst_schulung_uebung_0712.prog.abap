*&---------------------------------------------------------------------*
*& Report zst_schulung_uebung_0712
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_schulung_uebung_0712.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_name TYPE string
    iv_planetype TYPE saplane-planetype.
    Methods display_attributes.

Data: mv_name type string,
      mv_planetype type saplane-planetype.

CLASS-DATA: gv_n_o_airplanes TYPE i.

ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD constructor.
  mv_name = iv_name.
  mv_planetype = iv_planetype.
  Add 1 to gv_n_o_airplanes.

  ENDMETHOD.

  METHOD display_attributes.
WRITE: / 'Airplane Name: ', mv_name.
WRITE: / 'Planeype: ', mv_planetype.
Write: / gv_n_o_airplanes.
  ENDMETHOD.

ENDCLASS.

Data: go_airplane type ref to lcl_airplane.

      START-OF-SELECTION.
      create object go_airplane
      exporting iv_name = 'Airbus'
      iv_planetype = 'Boing 747'.

      go_airplane->display_attributes(  ).
