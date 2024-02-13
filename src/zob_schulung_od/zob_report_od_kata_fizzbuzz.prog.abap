*&---------------------------------------------------------------------*
*& Report zob_report_od_kata_fizzbuzz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_kata_fizzbuzz.

PARAMETERS p_zahl TYPE int1.
DATA lv_index TYPE c LENGTH 3.

START-OF-SELECTION.
  DO p_zahl TIMES.
* DO 100 TIMES.
  lv_index = sy-index.
  IF lv_index MOD 3 = 0 AND lv_index MOD 5 = 0.
    WRITE: / 'FizzBUzz'.
  ELSEIF  lv_index MOD 3 = 0
  OR lv_index CA '3'.
    WRITE: / 'Fizz'.
  ELSEIF  lv_index MOD 5 = 0
  OR lv_index CA '5'.
    WRITE: / 'Fuzz'.
  ELSE.
    WRITE: / sy-index.
  ENDIF.
ENDDO.
