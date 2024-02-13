CLASS zcl_fd_hello_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    Methods get_information RETURNING VALUE(rv_hello_abap) type string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fd_hello_abap IMPLEMENTATION.
  METHOD get_information.
    rv_hello_abap = 'Hello ABAP!'.
  ENDMETHOD.

ENDCLASS.
