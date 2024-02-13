CLASS zcl_st_fizzbuzz DEFINITION
 PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ts_list,
             number           TYPE int1,
             converted_number TYPE string,
           END OF ts_list,
           tt_list TYPE STANDARD TABLE OF ts_list WITH DEFAULT KEY.


    METHODS: convert_number IMPORTING iv_number        TYPE int1
                            RETURNING VALUE(rv_number) TYPE string,
      convert
        IMPORTING
          iv_number        TYPE int1
        RETURNING
          VALUE(rt_result) TYPE tt_list.



  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_zahl TYPE i.
    CONSTANTS lc_fizz TYPE string VALUE 'Fizz'.
    CONSTANTS lc_buzz TYPE string VALUE 'Buzz'.
    CONSTANTS lc_fizzbuzz TYPE string VALUE 'FizzBuzz'.

ENDCLASS.

CLASS zcl_st_fizzbuzz IMPLEMENTATION.
  METHOD convert_number.

    rv_number = COND #( WHEN iv_number MOD 5 = 0 AND iv_number MOD 3 = 0 THEN |FizzBuzz|
                          WHEN iv_number MOD 3 = 0 THEN |Fizz|
                          WHEN iv_number MOD 5 = 0 THEN |Buzz|
                          ELSE |{ iv_number }| ).

*    IF iv_number MOD 3 = 0 AND iv_number MOD 5 = 0.
*      rv_number = 'fizzbuzz'.
*    ELSEIF iv_number MOD 3 = 0.
*      rv_number = 'fizz'.
*    ELSEIF  iv_number MOD 5 = 0.
*      rv_number = 'buzz'.
*    ELSE.
*      rv_number = |{ iv_number }|.
*    ENDIF.

*    rv_number = COND #( WHEN iv_number MOD 3 = 0 AND iv_number MOD 5 = 0
*                        THEN lc_fizzbuzz
*                        WHEN iv_number MOD 3 = 0
*                        THEN lc_fizz
*                        WHEN iv_number MOD 5 = 0
*                        THEN lc_buzz
*                        ELSE |{ iv_number }|
*                        ).

*    rv_number = SWITCH #( iv_number MOD 15
*                          WHEN 0 THEN lc_fizzbuzz
*                          ELSE SWITCH #( iv_number MOD 3
*                                          WHEN 0 THEN lc_fizz
*                                          ELSE SWITCH #( iv_number MOD 5
*                                                          WHEN 0 THEN lc_buzz
*                                                          ELSE |{ iv_number }| ) ) ).


  ENDMETHOD.


  METHOD convert.

    DATA lv_count TYPE int1.

    lv_count = 1.
    WHILE lv_count <= iv_number.
      APPEND VALUE #( number = lv_count converted_number = convert_number( iv_number = lv_count ) ) TO rt_result.
      lv_count = lv_count + 1.
    ENDWHILE.


*    If iv_number = 1.
*    APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
*    Elseif iv_number = 2.
*    APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
*    APPEND VALUE #( number = 2 converted_number = '2' ) TO rt_result.
*    Else.
*    APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
*    APPEND VALUE #( number = 2 converted_number = '2' ) TO rt_result.
*    APPEND VALUE #( number = 3 converted_number = 'Fizz' ) TO rt_result.
*    Endif.

  ENDMETHOD.

ENDCLASS.
