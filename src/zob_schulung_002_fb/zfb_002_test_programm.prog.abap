*&---------------------------------------------------------------------*
*& Report zfb_002_test_programm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_002_test_programm.

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
