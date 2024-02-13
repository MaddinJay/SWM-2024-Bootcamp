*&---------------------------------------------------------------------*
*& Report z_hum_constructor_mit_select
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_constructor_mit_select.

" mv -> meine private Variable

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.

    METHODS: constructor IMPORTING iv_name      TYPE string
                         Exceptions wrong_call.       "Löst eine Exception aus

    METHODS: display_attributes.

    CLASS-METHODS: display_n_o_airplanes.

  PRIVATE SECTION.

    DATA:
      mv_name      TYPE string,
      mv_planetype TYPE saplane-planetype,
      mv_weight    TYPE saplane-weight,
      mv_tankcap   TYPE saplane-tankcap.

    CLASS-DATA gv_n_o_airplanes TYPE i.

ENDCLASS.


CLASS lcl_airplane IMPLEMENTATION.

  METHOD constructor.

    SELECT SINGLE
  FROM saplane
  FIELDS planetype, weight, tankcap
  WHERE planetype = 'A330-300'
  INTO @DATA(ls_airplane).

    mv_name = iv_name.
    mv_planetype = ls_airplane-planetype.
    mv_weight = ls_airplane-weight.
    mv_tankcap = ls_airplane-tankcap.
    raise wrong_call.                       "gibt die Exception aus wenn ein nicht vorhandener planetyp gewählt wird.
    ADD 1 TO gv_n_o_airplanes.

  ENDMETHOD.

  METHOD display_attributes.
    ULINE.
    WRITE:
     / 'Airplane Name: ', mv_name,
     / 'Planetype: ', mv_planetype,
     / 'Weight: ', mv_weight,
     / 'Tankcap: ', mv_tankcap.

  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: / 'Number of Airplanes: ', gv_n_o_airplanes.
  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

  DATA: gv_airplane            TYPE REF TO lcl_airplane,
        gv_number_of_airplanes TYPE i.

  gv_airplane = NEW #(
   iv_name = 'Airbus'
   ).

  lcl_airplane=>display_n_o_airplanes( ).

  gv_airplane->display_attributes( ).

END-OF-SELECTION.
