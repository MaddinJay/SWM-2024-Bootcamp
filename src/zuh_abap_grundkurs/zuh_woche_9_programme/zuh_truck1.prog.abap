*&---------------------------------------------------------------------*
*& Include zuh_truck1
*&---------------------------------------------------------------------*

CLASS lcl_truck DEFINITION INHERITING FROM lcl_vehicle.

  PUBLIC SECTION.

    METHODS set_weight IMPORTING iv_weight TYPE i.
    METHODS display_attributes REDEFINITION.
    METHODS constructor IMPORTING iv_tweight TYPE i
                                  iv_tmake   TYPE string
                                  iv_tmodel  TYPE string.

    CLASS-METHODS class_constructor.
    CLASS-METHODS stat_meth_truck.

  PROTECTED SECTION.
    CLASS-DATA kv_no_trucks TYPE i.

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

    lcl_vehicle=>get_counter( ).
    lcl_truck=>get_counter( ).
    lcl_truck=>kv_no_trucks = 10.
  ENDMETHOD.

  METHOD constructor.

    super->constructor( iv_make = iv_tmake iv_model = iv_tmodel ).
    mv_weight = iv_tweight.

  ENDMETHOD.

  METHOD class_constructor.
    WRITE / 'Dies ist der Class-Constructor von lcl_truck'.
  ENDMETHOD.

  METHOD stat_meth_truck.
    WRITE / 'Dies ist Methode LCL_VEHICLE=>STAT_METH_TRUCK()'.
  ENDMETHOD.

ENDCLASS.
