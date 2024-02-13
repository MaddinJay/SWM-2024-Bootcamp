*&---------------------------------------------------------------------*
*& Include          ZFD_HEAVY_TR
*&---------------------------------------------------------------------*

CLASS lcl_heavy_tr DEFINITION INHERITING FROM lcl_truck.

  PUBLIC SECTION.
    METHODS heavy_test.
    METHODS lif_wheel~check_wheel REDEFINITION.

ENDCLASS.

CLASS lcl_heavy_tr IMPLEMENTATION.

  METHOD heavy_test.

  ENDMETHOD.
  METHOD lif_wheel~check_wheel.
    WRITE / |Dies ist der Interface-Methodenaufruf aus LCL Heavy_tr.|.
  ENDMETHOD.


ENDCLASS.
