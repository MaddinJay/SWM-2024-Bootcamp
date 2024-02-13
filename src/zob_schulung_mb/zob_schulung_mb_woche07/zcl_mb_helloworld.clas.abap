CLASS zcl_mb_helloworld DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS hello returning value(result) TYPE string.

    PROTECTED SECTION.
    private section.
ENDCLASS.

CLASS zcl_mb_helloworld  IMPLEMENTATION.

  METHOD hello.

    result = 'Hello, World'.

  ENDMETHOD.

ENDCLASS.
