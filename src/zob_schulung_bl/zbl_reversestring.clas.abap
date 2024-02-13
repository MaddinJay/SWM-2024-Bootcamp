CLASS zbl_reversestring DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
                input         TYPE string
      RETURNING VALUE(result) TYPE string.
ENDCLASS.



CLASS zbl_reversestring IMPLEMENTATION.
  METHOD reverse_string.
result = reverse(  input ).
  ENDMETHOD.

ENDCLASS.
