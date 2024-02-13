CLASS zuh_exercism_string DEFINITION PUBLIC.

  PUBLIC SECTION.

  Data: lv_laenge Type i,
        lv_index Type i.





    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zuh_exercism_string IMPLEMENTATION.


  METHOD reverse_string.

result = reverse(  input ).

  ENDMETHOD.

ENDCLASS.
