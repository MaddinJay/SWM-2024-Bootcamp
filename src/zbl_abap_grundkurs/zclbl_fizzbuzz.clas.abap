CLASS zclbl_fizzbuzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS convert_number
    IMPORTING iv_number TYPE int1
    RETURNING VALUE(rv_result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclbl_fizzbuzz IMPLEMENTATION.
  METHOD convert_number.
rv_result = |1|.
  ENDMETHOD.

ENDCLASS.
