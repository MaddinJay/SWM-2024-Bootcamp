*&---------------------------------------------------------------------*
*& Report z2lblbc401_main
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z2lblbc401_main.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.

*    METHODS set_airplane_name IMPORTING iv_name TYPE string.
*    METHODS   set_planetype IMPORTING iv_planetype TYPE saplane-planetype.
    METHODS: display_attributes EXPORTING ev_name      TYPE string
                                          ev_planetype TYPE saplane-planetype.
    METHODS constructor IMPORTING iv_name      TYPE string
                                  iv_planetype TYPE saplane-planetype.
*                                  iv_weight    TYPE saplane-weight
*                                  iv_tankcap   TYPE saplane-tankcap.


    CLASS-METHODS display_n_o_airplanes.
    CLASS-METHODS get_n_o_airplanes RETURNING VALUE(rv_count) TYPE i.


  PRIVATE SECTION.

    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype.
*          mv_weight    TYPE saplane-weight,
*          mv_tankcap   TYPE saplane-tankcap.


    CLASS-DATA: gv_n_o_airplanes TYPE i.



ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

*  METHOD set_airplane_name.
*    mv_name = iv_name.
*  ENDMETHOD.

*  METHOD set_planetype.
*    mv_planetype = iv_planetype.
*  ENDMETHOD.
*
*  METHOD display_attributes.
*    ev_name = mv_name.
*  ENDMETHOD.
*
*  METHOD display_n_o_airplanes.
**WRITE:  / Der Name ist: { gv_n_o_airplanes }.
*  ENDMETHOD.
*
*  METHOD get_n_o_airplanes.
*
*  ENDMETHOD.

  METHOD constructor.
    mv_name = iv_name.
    mv_planetype = iv_planetype.
*    MV_WEIGHT = iv_weight.
*    mv_tankcap = iv_tankcap.
SELECT
FROM saplane
FIELDS *
WHERE planetype = @iv_planetype
INTO TABLE @DATA(gt_airplane).
cl_demo_output=>display( gt_airplane ).
    ADD 1 TO gv_n_o_airplanes.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE:'Planetype, Gewicht und Tankvolumen:', mv_name, mv_planetype.
  ENDMETHOD.

  METHOD display_n_o_airplanes.

  ENDMETHOD.

  METHOD get_n_o_airplanes.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
*  DATA:
*    go_airplane TYPE REF TO lcl_airplane,
*    gt_airplane TYPE TABLE OF REF TO lcl_airplane.
*  CREATE OBJECT go_airplane.
*  APPEND go_airplane TO gt_airplane.
*
*  CREATE OBJECT go_airplane.
*  APPEND go_airplane TO gt_airplane.
*
*  lcl_airplane=>display_n_o_airplanes( ).
*  go_airplane = NEW #( ).
*  lcl_airplane=>display_n_o_airplanes( ).
*
*  go_airplane->set_airplane_name( EXPORTING iv_name = 'Airbus' ).
*  go_airplane->set_planetype( iv_planetype = 'Boeing 747' ).
*
*  go_airplane->display_attributes( ).
  SELECT single
  FROM saplane
  FIELDS weight, tankcap
  WHERE planetype = 'MD11'
  INTO @DATA(lcl_airplane).
  DATA: go_airplane TYPE REF TO lcl_airplane.
  CREATE OBJECT go_airplane
    EXPORTING
      iv_name      = 'Ferrari'
      iv_planetype = '1'.
*      iv_weight = '50000'
*      iv_tankcap = '100'.
  DATA lt_tabelle TYPE TABLE OF REF TO lcl_airplane.
  APPEND go_airplane TO lt_tabelle.
  go_airplane->display_attributes( ).
