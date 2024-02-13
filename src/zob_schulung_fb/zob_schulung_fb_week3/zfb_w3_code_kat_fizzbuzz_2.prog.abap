*&---------------------------------------------------------------------*
*& Report zfb_002_test_programm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_w3_code_kat_fizzbuzz_2.

* Function Kata „FizzBuzz“
* Schreibe eine Funktion, die die Zahlen von 1 bis 100 zurückgibt.
* Manche Zahlen sollen dabei allerdings übersetzt werden [1]:
*
* Für Vielfache von 3 gibt „Fizz“ aus.
* Für Vielfache von 5 gib „Buzz“ aus.
* Für Vielfache von 3 und 5 gib „FizzBuzz“ aus.

DATA lt_ergebnis TYPE TABLE OF string.
DATA lv_zahl TYPE i.

DO 100 TIMES.
  lv_zahl = sy-index.

  IF lv_zahl MOD 3 = 0 AND lv_zahl MOD 5 = 0.
    APPEND 'FizzBuzz' TO lt_ergebnis.
  ELSEIF lv_zahl MOD 3 = 0.
    APPEND 'Fizz' TO lt_ergebnis.
  ELSEIF lv_zahl MOD 5 = 0.
    APPEND 'Buzz' TO lt_ergebnis.
  ELSE.
    APPEND lv_zahl TO lt_ergebnis.
  ENDIF.

ENDDO.

LOOP AT lt_ergebnis INTO DATA(lv_ergebnis).
  WRITE: / lv_ergebnis.
ENDLOOP.
ULINE.
