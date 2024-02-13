*&---------------------------------------------------------------------*
*& Include zuh_heavy_tr1
*&---------------------------------------------------------------------*

CLASS lcl_heavy_tr DEFINITION INHERITING FROM lcl_truck.

  PUBLIC SECTION.
    METHODS heavy_test.

ENDCLASS.
CLASS lcl_heavy_tr IMPLEMENTATION.

  METHOD heavy_test.
    lcl_heavy_tr=>get_counter( ).
    lcl_truck=>get_counter( ).
    lcl_vehicle=>get_counter( ).

    lcl_truck=>kv_no_trucks = 10.
    lcl_heavy_tr=>kv_no_trucks = 10.
  ENDMETHOD.

ENDCLASS.
