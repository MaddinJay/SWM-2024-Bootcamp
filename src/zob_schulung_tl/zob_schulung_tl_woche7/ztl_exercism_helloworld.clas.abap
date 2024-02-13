CLASS ztl_exercism_helloworld DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

  methods aufrufen.
  DATA helloworld TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS ztl_exercism_helloworld IMPLEMENTATION.



  METHOD aufrufen.
  helloworld = 'Hello, World!'.
WRITE: helloworld.
  ENDMETHOD.

ENDCLASS.
