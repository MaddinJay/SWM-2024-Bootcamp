CLASS zcl_bv_reverse_string DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bv_reverse_string IMPLEMENTATION.

  METHOD reverse_string.

    result = reverse( input ).

  ENDMETHOD.

ENDCLASS.
