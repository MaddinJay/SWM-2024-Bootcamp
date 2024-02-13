CLASS z_fizz_buzz_tl DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES: BEGIN OF ts_list, "Wir haben uns eine Liste deklariert und erstellt
             number           TYPE int1,
             converted_number TYPE string,
           END OF ts_list,
           tt_list TYPE STANDARD TABLE OF ts_list WITH DEFAULT KEY.

    METHODS convert_number IMPORTING iv_number        TYPE int1
                           RETURNING VALUE(rv_number) TYPE string.
    METHODS convert IMPORTING iv_number        TYPE int1
                    RETURNING VALUE(rt_result) TYPE tt_list. "Type tt_list die wir davor erstellt haben


    CONSTANTS fizz TYPE string VALUE 'Fizz'.
    CONSTANTS buzz TYPE string VALUE 'Buzz'.
    CONSTANTS fizzbuzz TYPE string VALUE 'FizzBuzz'.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS z_fizz_buzz_tl IMPLEMENTATION.
  METHOD convert_number.
    "rv_number = 1.
    rv_number = COND #(

    WHEN iv_number MOD 3 EQ 0 AND iv_number MOD 5 EQ 0 THEN fizzbuzz
    WHEN iv_number MOD 3 EQ 0 THEN fizz
    WHEN iv_number MOD 5 EQ 0  THEN buzz
    ELSE |{ iv_number }| "folgende Aufbau spricht die Variable an --> geschwungene klammer spricht variable an, man muss auch pipes nutzes ||

     ).

  ENDMETHOD.


  METHOD convert.
    IF iv_number = 1. "testmethode 1 mit 1 Zeile
      APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result. "Wir implementieren die Werte in die Tabelle rt_result ein.
    ELSEIF iv_number = 2. "unser Ergebnis Testmethode 2 mit 2 Zeilen
      APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
      APPEND VALUE #( number = 2 converted_number = '2' ) TO rt_result. "Wir müssen es mit If/else machen, da oben nur eine Zeile angezeigt wird und wir hier 2 Zeilen brauchen
    ELSEIF iv_number = 3. "Testmethode 3 mit 3 Zeilen
      APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
      APPEND VALUE #( number = 2 converted_number = '2' ) TO rt_result.
      APPEND VALUE #( number = 3 converted_number = 'Fizz' ) TO rt_result. "So geen wir uns jetzt 3 zeilen aus bei Testmethode 3
    ENDIF.

  ENDMETHOD.

ENDCLASS.
