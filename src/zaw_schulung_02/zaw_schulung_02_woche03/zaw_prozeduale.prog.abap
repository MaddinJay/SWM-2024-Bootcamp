*&---------------------------------------------------------------------*
*& Report zaw_prozeduale
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_prozeduale.


DATA: lv_fizz     TYPE string VALUE 'Fizz',
      lv_buzz     TYPE string VALUE 'Buzz',
      lv_fizzbuzz TYPE string VALUE 'FizzBuzz',
      lv_zahl     TYPE int1.

PARAMETERS p_zahl TYPE int1.
IF p_zahl MOD 15 EQ 0.
  WRITE: lv_fizzbuzz.
ELSEIF p_zahl MOD 5 EQ 0.
  WRITE: lv_buzz.
ELSEIF p_zahl MOD 3 EQ 0.
  WRITE: lv_fizz.
ELSE.
  WRITE: p_zahl.
ENDIF.

ULINE.

**********************************************************************
* Aufgabe 4 und 5
**********************************************************************

WHILE lv_zahl < p_zahl.
  lv_zahl = lv_zahl + 1.
  IF lv_zahl MOD 15 EQ 0.
    WRITE: / lv_fizzbuzz.
  ELSEIF lv_zahl MOD 5 EQ 0.
    WRITE: / lv_buzz.
  ELSEIF lv_zahl MOD 3 EQ 0.
    WRITE: / lv_fizz.
  ELSE.
    WRITE: / lv_zahl.
  ENDIF.
ENDWHILE.
