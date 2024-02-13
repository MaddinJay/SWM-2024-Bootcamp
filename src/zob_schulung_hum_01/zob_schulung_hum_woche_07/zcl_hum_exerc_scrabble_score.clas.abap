CLASS zcl_hum_exerc_scrabble_score DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hum_exerc_scrabble_score IMPLEMENTATION.
  METHOD score.
    DATA lv_count TYPE i.
    DATA: lv_count6 TYPE i,
          lv_count1 TYPE i,
          lv_count2 TYPE i,
          lv_count3 TYPE i,
          lv_count4 TYPE i,
          lv_count5 TYPE i.
    lv_count = Count_any_of( val = input
                             sub = '( \q \Q \ z\ Z )' ).
    lv_count = lv_count * 10.

    lv_count1 = count_any_of( val = input
                              sub = '( \d \D \ g\ G )' ).
    lv_count1 = lv_count1 * 2.

    lv_count2 = Count_any_of( val = input
                              sub = '( \b \B \c \C \m \M \p \P )' ).
    lv_count2 = lv_count2 * 3.

    lv_count3 = count_any_of( val = input
                              sub = '( \f \F \h \H \v \V \w \W \y \Y )' ).
    lv_count3 = lv_count3 * 4.

    lv_count4 = count_any_of( val = input
                              sub = '( \k \K )' ).
    lv_count4 = lv_count4 * 5.

    lv_count5 = count_any_of( val = input
                              sub = '( \j \J \x \X )' ).
    lv_count5 = lv_count5 * 8.

    lv_count6 = count_any_of( val = input
                              sub = '(a \A \e \E \i \I \o \O \u \U \l \L \n \N \r \R \s \S \t \T)' ).
    lv_count6 = lv_count6 * 1.

    result = lv_count + lv_count1 + lv_count2 + lv_count3 + lv_count4 + lv_count5 + lv_count6.
  ENDMETHOD.

ENDCLASS.
