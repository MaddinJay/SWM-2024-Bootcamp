*&---------------------------------------------------------------------*
*& Report zfd_test_week07
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_test_week07.

*******************************
* Scrabble Score from https://exercism.org/tracks/abap/exercises/scrabble-score/edit
*******************************

TYPES: BEGIN OF ty_scrabble,
         buchstabe TYPE c,
         wert      TYPE i,
       END OF ty_scrabble.

DATA ls_scrabble TYPE ty_scrabble.
DATA lt_scrabble TYPE STANDARD TABLE OF ty_scrabble.
DATA lv_input TYPE String VALUE 'HaUs'. "Donaudampfschifffahrtsgesellschaft
DATA lv_input2 TYPE String.

lv_input2 = lv_input. " lv_input2 wird nur für die Ausgabe Write benötigt.

*DATA lv_input_buchstabe(1) TYPE c.
DATA lv_wert_buchstabe TYPE i.
DATA lv_help_number TYPE i VALUE 0.
DATA lv_sum_wert TYPE i VALUE 0.

TRANSLATE lv_input TO LOWER CASE. " Alle gr. Buchstaben werden in kleine Buchstaben übersetzt.

WHILE strlen( lv_input ) > lv_help_number.
*  lv_input_buchstabe = lv_input+lv_help_number(1).

  CASE lv_input+lv_help_number(1).
    WHEN 'a' OR 'e' OR 'i' OR 'o' OR 'u' OR 'l' OR 'n' OR 'r' OR 's' OR 't'.
      lv_wert_buchstabe = 1.
    WHEN 'd' OR 'g'.
      lv_wert_buchstabe = 2.
    WHEN 'b' OR 'c' OR 'm' OR 'p'.
      lv_wert_buchstabe = 3.
    WHEN 'f' OR 'h' OR 'v' OR 'w' OR 'y'.
      lv_wert_buchstabe = 4.
    WHEN 'k'.
      lv_wert_buchstabe = 5.
    WHEN 'j' OR 'x'.
      lv_wert_buchstabe = 8.
    WHEN 'q' OR 'z'.
      lv_wert_buchstabe = 10.
  ENDCASE.

  ls_scrabble-buchstabe = lv_input+lv_help_number(1).
  ls_scrabble-wert = lv_wert_buchstabe.

  APPEND ls_scrabble TO lt_scrabble.
*  CLEAR ls_scrabble.

  lv_help_number = lv_help_number + 1.

ENDWHILE.

LOOP AT lt_scrabble INTO ls_scrabble.
  lv_sum_wert = ls_scrabble-wert + lv_sum_wert.
ENDLOOP.

WRITE: | Der Wert des Wortes "{ lv_input2 }" ist { lv_sum_wert }. |.

ULINE.

*******************************
* Reverse String from https://exercism.org/tracks/abap/exercises/reverse-string/edit
*******************************

DATA lv_input2_reverse TYPE string.
lv_input2_reverse = reverse( lv_input2 ).

WRITE | { lv_input2 } (String) = { lv_input2_reverse } (Reverse String) |.

WRITE /.
DATA lo_reverse_string TYPE REF TO zfd_reverse_string.
lo_reverse_string = NEW #( ).
lo_reverse_string->reverse_string( lv_input2 ).

ULINE.

*******************************
* Grains  from excercism
*******************************
TYPES type_result TYPE p LENGTH 16 DECIMALS 0.

DATA lv_result TYPE type_result.
DATA lv_grains_fields TYPE i VALUE 64.
DATA lo_grains TYPE REF TO zfd_grains.

lo_grains = NEW #( ).
lo_grains->square( EXPORTING input = lv_grains_fields
                   RECEIVING result = lv_result
                  ).

WRITE lv_result.
lo_grains->total( RECEIVING result = lv_result
                  ).
WRITE / lv_result.

ULINE.

*******************************
* high_Scores from excercism
*******************************
TYPES tt_integer TYPE STANDARD TABLE OF i WITH EMPTY KEY.
DATA lt_integer TYPE tt_integer.
DATA lt_integer_result TYPE tt_integer.
Data lv_ergebnis type i.
*cl_demo_output=>display( lt_integer ).
DATA lo_high_scores TYPE REF TO zfd_high_scores.

lt_integer = VALUE #(
                      ( 145 )
                      ( 210 )
                      ( 178 )
                      ( 187 )
                    ).
lo_high_scores = New #( lt_integer ).
lo_high_scores->list_scores( RECEIVING result = lt_integer_result ).
cl_demo_output=>display( lt_integer_result ).
lo_high_scores->personalbest( RECEIVING result = lv_ergebnis ).
write / lv_ergebnis.
