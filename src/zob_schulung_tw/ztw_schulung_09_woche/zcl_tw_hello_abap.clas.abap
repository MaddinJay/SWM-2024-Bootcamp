CLASS zcl_tw_hello_abap DEFINITION
 PUBLIC

  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS: get_information
      RETURNING VALUE(rv_message) TYPE string.

ENDCLASS.

CLASS zcl_tw_hello_abap IMPLEMENTATION.

  METHOD get_information.
    rv_message = 'Hello ABAP!'.
  ENDMETHOD.

ENDCLASS.
