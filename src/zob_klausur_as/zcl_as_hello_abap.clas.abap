CLASS zcl_as_hello_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_information RETURNING VALUE(rv_string) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_as_hello_abap IMPLEMENTATION.
  METHOD get_information.
    DATA(lv_string) = 'Hello ABAP!'.

    rv_string = lv_string.
  ENDMETHOD.

ENDCLASS.
