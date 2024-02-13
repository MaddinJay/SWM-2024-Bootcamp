*&---------------------------------------------------------------------*
*& Report zuh_fizzbuz2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_fizzbuz2.

DATA lv_zahl(3) TYPE c VALUE '0'.

PARAMETERS p_zaehl(3) TYPE n .

DO p_zaehl TIMES.

  lv_zahl = lv_zahl + 1.

  IF lv_zahl MOD 3 EQ 0 AND lv_zahl MOD 5 EQ 0.
    WRITE: / lv_zahl, 'Fizzbuzz'.

  ELSEIF lv_zahl MOD 3 EQ 0 OR lv_zahl CA '3'.
    WRITE: / lv_zahl, 'Fizz'.

  ELSEIF lv_zahl MOD 5 EQ 0 OR lv_zahl CA '5'.
    WRITE: / lv_zahl, 'Buzz'.

  ELSE.
    WRITE: / lv_zahl.

  ENDIF.

ENDDO.
