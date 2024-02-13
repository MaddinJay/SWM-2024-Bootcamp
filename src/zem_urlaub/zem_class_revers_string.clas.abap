CLASS zem_class_revers_string DEFINITION


  PUBLIC

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



CLASS zem_class_revers_string IMPLEMENTATION.

  METHOD reverse_string.


  result = reverse( input ).

  ENDMETHOD.

ENDCLASS.
