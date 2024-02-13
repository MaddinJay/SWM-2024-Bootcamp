CLASS zcl_bl_hello_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_information RETURNING VALUE(rv_message) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bl_hello_abap IMPLEMENTATION.
  METHOD get_information.
rv_message = 'Hello ABAP!'.
  ENDMETHOD.

ENDCLASS.
