CLASS zaw_gcl_fizzbuzz DEFINITION
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
      IMPORTING iv_number        TYPE int1
      RETURNING VALUE(rv_result) TYPE string.

    METHODS convert
      IMPORTING iv_number        TYPE int1
      RETURNING VALUE(rt_result) TYPE tt_list.

  PROTECTED SECTION.
  PRIVATE SECTION.

    CONSTANTS: lc_fizz     TYPE string VALUE 'fizz',
               lc_buzz     TYPE string VALUE 'buzz',
               lc_fizzbuzz TYPE string VALUE 'fizzbuzz'.

ENDCLASS.


CLASS zaw_gcl_fizzbuzz IMPLEMENTATION.

  METHOD convert_number.

    rv_result = COND #( WHEN iv_number MOD 5 EQ 0 AND iv_number MOD 3 EQ 0 THEN lc_fizzbuzz
                        WHEN iv_number MOD 3 EQ 0 THEN lc_fizz
                        WHEN iv_number MOD 5 EQ 0 THEN lc_buzz
                        ELSE iv_number ).

*    rv_result = SWITCH #( iv_number MOD 15
*                            WHEN 0 THEN lc_fizzbuzz
*                            ELSE SWITCH #( iv_number MOD 3
*                                            WHEN 0 THEN lc_fizz
*                                            ELSE SWITCH #( iv_number MOD 5
*                                                            WHEN 0 THEN lc_buzz
*                                                            ELSE iv_number
*                                                            ) ) ).

  ENDMETHOD.

  METHOD convert.

    DATA lv_count TYPE int1.
    lv_count = 1.

    WHILE lv_count <= iv_number.
      APPEND VALUE #( number = iv_number converted_number = convert_number( iv_number = lv_count ) ) TO rt_result.
      lv_count = lv_count + 1.
    ENDWHILE.

*    IF iv_number = 1.
*      APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
*    ELSEIF iv_number = 2.
*      APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
*      APPEND VALUE #( number = 2 converted_number = '2' ) TO rt_result.
*    ELSEIF iv_number = 3.
*      APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
*      APPEND VALUE #( number = 2 converted_number = '2' ) TO rt_result.
*      APPEND VALUE #( number = 3 converted_number = '3' ) TO rt_result.
*    ENDIF.

  ENDMETHOD.

ENDCLASS.
