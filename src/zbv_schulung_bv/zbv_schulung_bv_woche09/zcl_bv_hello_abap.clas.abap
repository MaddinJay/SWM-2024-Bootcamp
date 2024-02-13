CLASS zcl_bv_hello_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_information RETURNING VALUE(rv_hello_abap) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bv_hello_abap IMPLEMENTATION.

  METHOD get_information.
    rv_hello_abap = 'Hello ABAP!'.
  ENDMETHOD.

ENDCLASS.
