CLASS zcl_mj_fizzbuzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ts_list,
             number           TYPE int1,
             converted_number TYPE string,
           END OF ts_list,
           tt_list TYPE STANDARD TABLE OF ts_list WITH DEFAULT KEY.

    METHODS convert_number IMPORTING iv_number        TYPE int1
                           RETURNING VALUE(rv_number) TYPE string.

    METHODS convert        IMPORTING iv_number        TYPE int1
                           RETURNING VALUE(rt_result) TYPE tt_list.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mj_fizzbuzz IMPLEMENTATION.

  METHOD convert_number.
    rv_number = COND #( WHEN iv_number MOD 5 = 0 AND iv_number MOD 3 = 0 THEN |FizzBuzz|
                        WHEN iv_number MOD 3 = 0 THEN |Fizz|
                        WHEN iv_number MOD 5 = 0 THEN |Buzz|
                        ELSE |{ iv_number }| ).
  ENDMETHOD.

  METHOD convert.
    DATA lv_count TYPE int1.

    lv_count = 1.
    WHILE lv_count <= iv_number.
      APPEND VALUE #( number = lv_count converted_number = convert_number( iv_number = lv_count ) ) TO rt_result.
      lv_count = lv_count + 1.
    ENDWHILE.
  ENDMETHOD.

ENDCLASS.
