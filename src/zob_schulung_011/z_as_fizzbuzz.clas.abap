CLASS z_as_fizzbuzz DEFINITION
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
        iv_number        TYPE int1
      RETURNING
        VALUE(rv_number) TYPE string.

    METHODS convert IMPORTING iv_number        TYPE int1
                    RETURNING VALUE(rt_result) TYPE tt_list.
  PROTECTED SECTION.
  PRIVATE SECTION.
*    CONSTANTS: lc_fizz     TYPE string VALUE 'Fizz',
*               lc_buzz     TYPE string VALUE 'Buzz',
*               lc_fizzbuzz TYPE string VALUE 'Fizzbuzz'.
    DATA: lv_zahl.
ENDCLASS.



CLASS z_as_fizzbuzz IMPLEMENTATION.

  METHOD convert_number.

*    rv_number = COND #( WHEN iv_number MOD 5 EQ 0 AND iv_number MOD 3 EQ 0 THEN lc_fizzbuzz
*                      WHEN iv_number MOD 3 EQ 0 THEN lc_fizz
*                      WHEN iv_number MOD 5 EQ 0 THEN lc_buzz
*                      ELSE iv_number ).
    rv_number = COND #( WHEN iv_number MOD 5 = 0 AND iv_number MOD 3 = 0 THEN |FizzBuzz|
                        WHEN iv_number MOD 3 = 0 THEN |Fizz|
                        WHEN iv_number MOD 5 = 0 THEN |Buzz|
                        ELSE |{ iv_number }| ).

*    IF iv_number MOD 5 EQ 0 AND iv_number MOD 3 EQ 0.
*      rv_number = 'fizzbuzz'.
*    ELSEIF iv_number MOD 5 EQ 0.
*      rv_number = 'buzz'.
*    ELSEIF iv_number MOD 3 EQ 0.
*      rv_number = 'fizz'.
*    ELSE.
*      rv_number = iv_number.
*    ENDIF.

  ENDMETHOD.

  METHOD convert.
*  IF iv_number = 1.
*      rt_result = VALUE #( ( number = 1 converted_number = '1' ) ).
*    ELSEIF iv_number = 2.
*      APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
*      APPEND VALUE #( number = 2 converted_number = '2' ) TO rt_result.
*    ELSE.
*      APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
*      APPEND VALUE #( number = 2 converted_number = '2' ) TO rt_result.
*      APPEND VALUE #( number = 3 converted_number = 'fizz' ) TO rt_result.
*    ENDIF.
  DATA lv_count TYPE int1.

    lv_count = 1.
    WHILE lv_count <= iv_number.
      APPEND VALUE #( number = lv_count converted_number = convert_number( iv_number = lv_count ) ) TO rt_result.
          lv_count = lv_count + 1.
    ENDWHILE.
  ENDMETHOD.


ENDCLASS.
