CLASS zfb_fizzbuzz DEFINITION
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
        VALUE(rv_result) TYPE string.

    METHODS convert
      IMPORTING
        iv_number        TYPE int1
      RETURNING
        VALUE(rt_result) TYPE tt_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zfb_fizzbuzz IMPLEMENTATION.

  METHOD convert_number.

    rv_result = COND #( WHEN iv_number MOD 5 EQ 0 AND iv_number MOD 3 EQ 0 THEN 'fizzbuzz'
    WHEN iv_number MOD 3 EQ 0 THEN 'fizz'
    WHEN iv_number MOD 5 EQ 0 THEN 'buzz' ).

*    IF iv_number = 1.
*      rv_result = |1|.
*    ELSEIF iv_number = 2.
*      rv_result = |2|.
*    ELSEIF iv_number = 3.
*      rv_result = 'fizz'.
*    ELSEIF iv_number = 5.
*      rv_result = 'buzz'.
*    ELSEIF iv_number = 6.
*      rv_result = 'fizz'.
*    ELSEIF iv_number = 10.
*      rv_result = 'buzz'.
*    ELSEIF iv_number = 15.
*      rv_result = 'fizzbuzz'.
*    ELSEIF iv_number = 30.
*      rv_result = 'fizzbuzz'.
*    ENDIF.

*  IF iv_number MOD 3 = 0 AND iv_number MOD 5 = 0.
*    rv_result = 'fizzbuzz'.
*  ELSEIF iv_number MOD 3 = 0.
*    rv_result = 'Fizz'.
*  ELSEIF iv_number MOD 5 = 0.
*    rv_result = 'buzz'.
*  ELSE.
*    rv_result = iv_number.
*  ENDIF.

  ENDMETHOD.

  METHOD convert.

  ENDMETHOD.

ENDCLASS.
