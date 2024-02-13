CLASS ZOB_LV_RESERVE_STRING DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS ZOB_LV_RESERVE_STRING IMPLEMENTATION.

  METHOD reverse_string.
    " Please complete the implementation of the reverse_string method
    result = input.
  ENDMETHOD.

ENDCLASS.
