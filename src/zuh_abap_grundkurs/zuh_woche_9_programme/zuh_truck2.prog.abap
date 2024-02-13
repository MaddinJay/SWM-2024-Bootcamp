*&---------------------------------------------------------------------*
*& Include zuh_truck2
*&---------------------------------------------------------------------*

CLASS lcl_truck DEFINITION INHERITING FROM lcl_vehicle.

  PUBLIC SECTION.

    METHODS set_weight IMPORTING iv_weight TYPE i.
    METHODS display_attributes REDEFINITION.
    METHODS constructor IMPORTING iv_tweight TYPE i
                                  iv_tmake   TYPE string
                                  iv_tmodel  TYPE string.
    METHODS estimate_fuel REDEFINITION.


  PRIVATE SECTION.
    DATA mv_weight TYPE i.


ENDCLASS.


CLASS lcl_truck IMPLEMENTATION.

  METHOD set_weight.
    mv_weight = iv_weight.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE : / 'Make' , mv_make.
    WRITE : / 'Model' , mv_model.
    WRITE : / 'Gewicht' , mv_weight.
  ENDMETHOD.

  METHOD constructor.

    super->constructor( iv_make = iv_tmake iv_model = iv_tmodel ).
    mv_weight = iv_tweight.

  ENDMETHOD.



  METHOD estimate_fuel.
    rv_fuel = iv_dist / 100 * 10.
  ENDMETHOD.

ENDCLASS.
