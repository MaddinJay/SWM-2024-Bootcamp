*&---------------------------------------------------------------------*
*& Include zuh_bus1
*&---------------------------------------------------------------------*

CLASS lcl_bus DEFINITION INHERITING FROM lcl_vehicle.

  PUBLIC SECTION.

    METHODS display_attributes REDEFINITION.
    METHODS constructor IMPORTING iv_bpass  TYPE i
                                  iv_bmake  TYPE string
                                  iv_bmodel TYPE string.
    METHODS estimate_fuel REDEFINITION.


  PRIVATE SECTION.
    DATA mv_pass TYPE i.


ENDCLASS.

CLASS lcl_bus IMPLEMENTATION.

  METHOD constructor.

    super->constructor( iv_make = iv_bmake iv_model = iv_bmodel ).
    mv_pass = iv_bpass.

  ENDMETHOD.

  METHOD display_attributes.
    WRITE : / 'Make' , mv_make.
    WRITE : / 'Model' , mv_model.
    WRITE : / 'Passagier' , mv_pass.
  ENDMETHOD.

  METHOD estimate_fuel.
    rv_fuel = iv_dist / 100 * 15.
  ENDMETHOD.

ENDCLASS.
