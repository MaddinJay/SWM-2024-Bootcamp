CLASS zod_lcl_fizzbuzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS convert_number
      IMPORTING
        lv_number        TYPE int1
      RETURNING
        value(rv_number) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zod_lcl_fizzbuzz IMPLEMENTATION.

  METHOD convert_number.
  rv_number = COND #(
                        WHEN lv_number mod 15 eq 0 THEN 'fizzbuzz'
                        WHEN lv_number mod 5 eq 0 THEN 'buzz'
                        WHEN lv_number mod 3 eq 0 THEN 'fizz'
                        else |{ lv_number }|
                         ).
  ENDMETHOD.

ENDCLASS.
