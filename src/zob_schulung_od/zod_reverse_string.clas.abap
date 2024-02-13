CLASS zod_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
  PRIVATE SECTION.
    DATA mv_input TYPE string.
ENDCLASS.

CLASS zod_reverse_string IMPLEMENTATION.

  METHOD reverse_string.
    " Please complete the implementation of the reverse_string method
*    result = reverse(  input ).
    mv_input = input.
    DO.
      IF  mv_input IS INITIAL.
        EXIT.
      ENDIF.

      CONCATENATE mv_input(1) result INTO result.
      SHIFT mv_Input.

    ENDDO.


  ENDMETHOD.

ENDCLASS.
