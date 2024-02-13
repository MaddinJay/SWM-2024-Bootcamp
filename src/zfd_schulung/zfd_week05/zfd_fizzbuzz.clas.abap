CLASS zfd_fizzbuzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ts_list,
             number           TYPE int1,
             converted_number TYPE String,
           END OF ts_list,
           tt_list TYPE STANDARD TABLE OF ts_list WITH DEFAULT KEY.

    METHODS: convert_number IMPORTING iv_number        TYPE int1
                            RETURNING VALUE(rv_number) TYPE string.

    METHODS: convert IMPORTING iv_number        TYPE i
                     RETURNING VALUE(rt_result) TYPE tt_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_zahl TYPE n LENGTH 2 VALUE 0.
    Data mv_zahl_bool type abap_bool.

    CONSTANTS lc_fizz TYPE string VALUE 'fizz'.
    CONSTANTS lc_buzz TYPE string VALUE 'buzz'.
    CONSTANTS lc_fizzbuzz TYPE string VALUE 'fizzbuzz'.

ENDCLASS.

CLASS zfd_fizzbuzz IMPLEMENTATION.
  METHOD convert_number.



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

    mv_zahl = iv_number.


    rv_number = SWITCH #( iv_number MOD 15
                          WHEN 0 THEN lc_fizzbuzz
                          ELSE SWITCH #( iv_number MOD 3
                                          WHEN 0 THEN lc_fizz
                                          ELSE SWITCH #( iv_number MOD 5
                                                          WHEN 0 THEN lc_buzz
                                                          ELSE SWITCH #( mv_zahl
                                                                         when '53' then 'Legendary 53'
                                                                         else switch #( mv_zahl(1)
                                                                                        when 3 then lc_fizz
                                                                                        when 5 then lc_buzz
                                                                                        else switch #( mv_zahl+1(1)
                                                                                                      when 3 then lc_fizz
                                                                                                      when 5 then lc_buzz
                                                                                                      else |{ iv_number }|
                                                                                        ) ) ) ) ) ).



  ENDMETHOD.

  METHOD convert.
    DATA lv_count TYPE int1 Value 1.
    WHILE lv_count <= iv_number.
      APPEND VALUE #( number = lv_count converted_number = convert_number( iv_number = lv_count ) ) TO rt_result.
      lv_count = lv_count + 1.
    ENDWHILE.

  ENDMETHOD.

ENDCLASS.
