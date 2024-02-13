CLASS zcl_uh_hello_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  methods get_information RETURNING VALUE(rv_wert) type string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_uh_hello_abap IMPLEMENTATION.
  METHOD get_information.

  rv_wert = 'Hello ABAP!'.

  ENDMETHOD.

ENDCLASS.



