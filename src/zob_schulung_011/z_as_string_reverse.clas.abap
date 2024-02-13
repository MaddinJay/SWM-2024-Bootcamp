CLASS z_as_string_reverse DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS z_as_string_reverse IMPLEMENTATION.

  METHOD reverse_string.
    " Please complete the implementation of the reverse_string method
    result = reverse( input ).
*    result = input.
  ENDMETHOD.

ENDCLASS.

