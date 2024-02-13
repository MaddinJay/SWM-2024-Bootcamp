CLASS zcl_em_hello_abap DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

  Methods get_information RETURNING VALUE(rv_string) type string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_em_hello_abap IMPLEMENTATION.
  METHOD get_information.

Data lv_string type string.
lv_string = 'HELLO ABAP!'.

rv_string = lv_string.



  ENDMETHOD.

ENDCLASS.
