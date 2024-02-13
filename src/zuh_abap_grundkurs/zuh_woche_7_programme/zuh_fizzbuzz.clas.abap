CLASS zuh_fizzbuzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF ts_list,
             number           TYPE int1,
             converted_number TYPE string,
           END OF ts_list,
           tt_list TYPE STANDARD TABLE OF ts_list WITH DEFAULT KEY.

    METHODS convert_number
      IMPORTING
        iv_number        TYPE i
      RETURNING
        VALUE(rv_number) TYPE string.

    METHODS convert
      IMPORTING
        iv_number        TYPE i
      RETURNING
        VALUE(rt_result) TYPE tt_list.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS fizz TYPE string VALUE `Fizz`.
    CONSTANTS buzz TYPE string VALUE `Buzz`.

ENDCLASS.

CLASS zuh_fizzbuzz IMPLEMENTATION.

  METHOD convert_number.
    DATA lv_number(3) TYPE n.
    lv_number = iv_number.
    rv_number = COND #(  WHEN lv_number MOD 3 EQ 0 AND lv_number MOD 5 EQ 0 THEN |{ fizz }{ buzz }|
                         WHEN lv_number CA '3' AND lv_number CA '5' THEN |{ fizz }{ buzz }|
                         WHEN lv_number MOD 3 EQ 0 OR lv_number CA '3' THEN |{ fizz }|
                         WHEN lv_number MOD 5 EQ 0 OR lv_number CA '5' THEN |{ buzz }|
                         ELSE lv_number ).
  ENDMETHOD.

  METHOD convert.
    DATA lv_count TYPE i.
    lv_count = 1.
    WHILE lv_count <= iv_number.
      APPEND VALUE #(  number = lv_count converted_number = convert_number( iv_number = lv_count ) ) TO rt_result.
      lv_count = lv_count + 1.
    ENDWHILE.
  ENDMETHOD.

ENDCLASS.
