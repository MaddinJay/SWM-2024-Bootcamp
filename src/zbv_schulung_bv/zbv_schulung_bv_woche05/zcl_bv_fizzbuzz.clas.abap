CLASS zcl_bv_fizzbuzz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ts_list,                      "Struktur-Typen deklariert
             number           TYPE int1,          "1. Spalte zugewiesen
             converted_number TYPE string,        "2. Spalte zugewiesen
           END OF ts_list,
           tt_list TYPE STANDARD TABLE OF ts_list WITH DEFAULT KEY. "Tabelle mit Default Key angelegt

    METHODS convert_number IMPORTING iv_number        TYPE int1
                           RETURNING VALUE(rv_number) TYPE string
                           .
    METHODS convert IMPORTING iv_number        TYPE int1
                    RETURNING VALUE(rt_result) TYPE tt_list. "wir wollen ein Zahl oder Text ausgeben, daher STRING

  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS: gc_fizz     TYPE string VALUE 'Fizz',
               gc_buzz     TYPE string VALUE 'Buzz',
               gc_fizzbuzz TYPE string VALUE 'FizzBuzz'.
ENDCLASS.



CLASS zcl_bv_fizzbuzz IMPLEMENTATION.

  METHOD convert_number.
*        rv_number = SWITCH #( iv_number
*                            WHEN '1' THEN '1'
*                            WHEN '2' THEN '2'
*                            WHEN '3' THEN gc_fizz
*                            WHEN '5' THEN gc_Buzz
*                            WHEN '15' THEN gc_fizzbuzz
*                            WHEN '6' THEN gc_fizz
*                            WHEN '10' THEN gc_Buzz
*                            WHEN '30' THEN gc_fizzbuzz
*                                                       ).



*IF iv_number MOD 15 EQ 0.
*  rv_number = gc_fizzbuzz.
*ELSEIF iv_number MOD 5 EQ 0.
*  rv_number = gc_buzz.
*ELSEIF iv_number MOD 3 EQ 0.
*  rv_number = gc_fizz.
*ELSE.
*  rv_number = |{ iv_number }|. "Convert Number: iv_number wurde mit Strich und geschweifte Klammer geschrieben, damit die Variable richtig konvertiert wird ohne Leerzeichen hinter der Zahl.
*ENDIF.

    rv_number = COND #(
    WHEN iv_number MOD 15 EQ 0 THEN gc_fizzbuzz
    WHEN iv_number MOD 5 EQ 0 THEN gc_buzz
    WHEN iv_number MOD 3 EQ 0 THEN gc_fizz
    ELSE |{ iv_number }| ). "Convert Number: folgende Aufbau spricht die Variable an --> geschwungene klammer spricht variable an, man muss auch pipes nutzes ||

*    rv_number = SWITCH #(  iv_number MOD 15
*                           WHEN 0 THEN gc_fizzbuzz
*                           ELSE SWITCH #( iv_number MOD 5
*                                          WHEN 0 THEN gc_buzz
*                           ELSE SWITCH #( iv_number MOD 3
*                                          WHEN 0 THEN gc_fizz
*                           ELSE |{ iv_number }| ) ) ). "Convert Number: folgende Aufbau spricht die Variable an --> geschwungene klammer spricht variable an, man muss auch pipes nutzes ||

  ENDMETHOD.


  METHOD convert.
    DATA lv_count TYPE int1.

    lv_count = 1.

    WHILE lv_count <= iv_number.                                                                                  "Lösung mit While für die Tabelle
      APPEND VALUE #( number = lv_count converted_number = convert_number( iv_number = lv_count ) ) TO rt_result.
      lv_count = lv_count + 1.
    ENDWHILE.


*    IF iv_number = 1.                                                   "If-Funktion wird benutzt, damit der Test bei dem Import 1 eine Zeile ausgibt, bei Import 2 soleln 2 Zeilen und bei 3 sollen 3 Zeilen erstellt werden.
*      APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
*    ELSEIF iv_number = 2.
*      APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
*      APPEND VALUE #( number = 2 converted_number = '2' ) TO rt_result.
*    ELSE.
*      APPEND VALUE #( number = 1 converted_number = '1' ) TO rt_result.
*      APPEND VALUE #( number = 2 converted_number = '2' ) TO rt_result.
*      APPEND VALUE #( number = 3 converted_number = 'Fizz' ) TO rt_result.
*    ENDIF.
*    APPEND VALUE #( number = 2 converted_number = '2' ) TO rt_result. "Geht in dem Fall nicht, da der erste Testfall auf Rot gesetzt wird, da es 2 Zeilen sind aber eine erwartet wird
  ENDMETHOD.

ENDCLASS.
