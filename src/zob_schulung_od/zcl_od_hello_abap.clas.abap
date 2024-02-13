CLASS zcl_od_hello_abap DEFINITION PUBLIC CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS get_information
      RETURNING VALUE(rv_info) TYPE string.

ENDCLASS.

CLASS zcl_od_hello_abap IMPLEMENTATION.

  METHOD get_information.
    rv_info = 'Hello ABAP!'.
  ENDMETHOD.

ENDCLASS.
