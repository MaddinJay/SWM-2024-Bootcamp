CLASS zcl_mb_hello_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  methods get_information RETURNING VALUE(rv_hello) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mb_hello_abap IMPLEMENTATION.
  METHOD get_information.

rv_hello = 'Hello ABAP!'.

  ENDMETHOD.

ENDCLASS.


