*&---------------------------------------------------------------------*
*& Include          ZFD_TRUCK
*&---------------------------------------------------------------------*

CLASS lcl_truck DEFINITION INHERITING FROM lcl_vehicle.

  PUBLIC SECTION.
    METHODS set_weight IMPORTING iv_weight TYPE i.
    METHODS display_attributes REDEFINITION.
    METHODS constructor IMPORTING iv_tweight TYPE i
                                  iv_tmake   TYPE string
                                  iv_tmodel  TYPE string.
    METHODS estimate_fuel REDEFINITION.

    INTERFACES lif_wheel.
    ALIASES meth FOR lif_wheel~check_wheel.
    EVENTS truck_available EXPORTING VALUE(ev_string) type String.


  PRIVATE SECTION.
    DATA mv_weight TYPE i.

ENDCLASS.

CLASS lcl_truck IMPLEMENTATION.

  METHOD set_weight.
    me->mv_weight = iv_weight.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE :/ 'Make:', mv_make.
    WRITE :/ 'Model:', mv_model.
    WRITE :/ 'Gewicht:', mv_weight.
  ENDMETHOD.

  METHOD constructor.
    WRITE / 'Hello World'.
    super->constructor(
     EXPORTING
      iv_make = iv_tmake
      iv_model = iv_tmodel ).
    me->mv_weight = iv_tweight.
    RAISE EVENT truck_available EXPORTING ev_string = 'Das ist ein Übergabeparameter.'.

  ENDMETHOD.

  METHOD estimate_fuel.
    rv_fuel = iv_dist / 100 * 10.
  ENDMETHOD.

  METHOD lif_wheel~check_wheel.
    WRITE / |Dies ist der Interface-Methodenaufruf-aus lcl-truck|.
  ENDMETHOD.

  METHOD lif_wheel~get_no_of_wheels.
    rv_no_of_wheels = lif_wheel~kv_no_of_wheels.
  ENDMETHOD.

ENDCLASS.
