CLASS zcl_tl_hello_abap DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
  "Öffentliche Instanz Methode
  METHODS get_information RETURNING value(rv_result) type string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tl_hello_abap IMPLEMENTATION.
  METHOD get_information.

  rv_result = 'Hello ABAP!'.

  ENDMETHOD.

ENDCLASS.
