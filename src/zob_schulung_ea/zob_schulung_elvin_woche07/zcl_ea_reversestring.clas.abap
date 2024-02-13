CLASS zcl_ea_reversestring DEFINITION
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



CLASS zcl_ea_reversestring IMPLEMENTATION.

METHOD reverse_string.

result = input.

IF input is INITIAL.
result = reverse( input ).
ELSE.
result = reverse( input ).
ENDIF.


  ENDMETHOD.

ENDCLASS.
