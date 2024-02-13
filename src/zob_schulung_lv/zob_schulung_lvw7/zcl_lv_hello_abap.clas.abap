CLASS zcl_lv_hello_abap DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_information
      RETURNING
        value(result) type string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lv_hello_abap IMPLEMENTATION.
  METHOD get_information.
    result = 'Hello ABAP!'.
  ENDMETHOD.

ENDCLASS.
