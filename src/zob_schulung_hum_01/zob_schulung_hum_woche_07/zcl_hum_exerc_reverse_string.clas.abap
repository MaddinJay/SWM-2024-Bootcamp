CLASS zcl_hum_exerc_reverse_string DEFINITION
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



CLASS zcl_hum_exerc_reverse_string IMPLEMENTATION.
  METHOD reverse_string.
   " Please complete the implementation of the reverse_string method
    if input is INITIAL.
    result = reverse( input ).
    else.
    result = reverse( input ).
    Endif.
  ENDMETHOD.

ENDCLASS.
