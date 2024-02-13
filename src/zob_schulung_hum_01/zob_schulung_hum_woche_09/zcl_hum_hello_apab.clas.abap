CLASS zcl_hum_hello_apab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_information RETURNING VALUE(information) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hum_hello_apab IMPLEMENTATION.
  METHOD get_information.
    information = 'Hello ABAP!'.
  ENDMETHOD.

ENDCLASS.
