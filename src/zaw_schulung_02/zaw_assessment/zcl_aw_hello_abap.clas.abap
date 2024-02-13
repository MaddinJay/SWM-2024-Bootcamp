CLASS zcl_aw_hello_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_information
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aw_hello_abap IMPLEMENTATION.

  METHOD get_information.

    result = 'Hello ABAP'.

  ENDMETHOD.

ENDCLASS.
