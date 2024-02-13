*&---------------------------------------------------------------------*
*& Report z_uebung4_constructor_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung4_constructor_tl.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_name      TYPE string
                                  iv_planetype TYPE saplane-planetype
                                  iv_weight TYPE saplane-weight
                                  iv_tankcap TYPE saplane-tankcap.
    METHODS display_attributes.

    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype,
          mv_weight    TYPE saplane-weight,
          mv_tankcap   TYPE saplane-tankcap.

    CLASS-DATA: gv_n_o_airplanes TYPE i.

ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD constructor.
    mv_name = iv_name.
    mv_planetype = iv_planetype.
    mv_weight = iv_weight.
    mv_tankcap = iv_tankcap.
    ADD 1 TO gv_n_o_airplanes.

  ENDMETHOD.

  METHOD display_attributes.
    WRITE: / 'Airplane Name: ', mv_name.
    WRITE: / 'Planeype: ', mv_planetype.
    WRITE: / 'Number of airplanes: ', gv_n_o_airplanes.
    WRITE: / 'Weight: ', mv_weight.
    WRITE: / 'Tankcap: ', mv_tankcap.
  ENDMETHOD.

ENDCLASS.

DATA: go_airplane TYPE REF TO lcl_airplane.

START-OF-SELECTION.
  CREATE OBJECT go_airplane
    EXPORTING
      iv_name      = 'Airbus'
      iv_planetype = 'Boing 747'
      iv_weight = 33000000
      iv_tankcap = 140000.
  go_airplane->display_attributes(  ).
