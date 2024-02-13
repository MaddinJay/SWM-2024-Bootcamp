*&---------------------------------------------------------------------*
*& Report zfb_w3_code_kat_fizzbuzz_5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_w3_code_kat_fizzbuzz_5.

* Aufgabe 5
* Erweitere den Report so, dass im Protokoll die konvertierten Zahlen
* angedruckt werden, wie in der Aufgabenstellung beschrieben (1, 2, FIZZ, …)

PARAMETERS p_zahl TYPE INT1.

DATA lt_ergebnis TYPE TABLE OF string.
DATA lv_zahl TYPE i.

lv_zahl = 0.

DO p_zahl TIMES.
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
