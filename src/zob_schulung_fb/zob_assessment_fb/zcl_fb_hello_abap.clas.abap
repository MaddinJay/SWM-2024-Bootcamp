CLASS zcl_fb_hello_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_information RETURNING VALUE(info) TYPE string.         "öffentliche Instanzmethode

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fb_hello_abap IMPLEMENTATION.

  METHOD get_information.                                             "Methode um Information auszugeben
    info = 'Hello ABAP!'.
  ENDMETHOD.
ENDCLASS.
