*&---------------------------------------------------------------------*
*& Report z_hum_kata_fizz_buzz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_kata_fizz_buzz.

**********************************************************************
*Datendeklaration
**********************************************************************

DATA: lv_fizz     TYPE string VALUE 'Fizz',
      lv_buzz     TYPE string VALUE 'Buzz',
      lv_fizzbuzz TYPE string VALUE 'FizzBuzz',
      lv_zahl Type int1.

PARAMETERS p_zahl TYPE int1.

**********************************************************************
* Aufgabe 3
**********************************************************************

IF p_zahl MOD 15 EQ 0.
  WRITE: lv_fizzbuzz.
ELSEIF p_zahl MOD 5 EQ 0.
  WRITE: lv_buzz.
ELSEIF p_zahl MOD 3 EQ 0.
  Write: lv_fizz.
ELSE.
  WRITE: P_ZAHL, 'Deine Zahl lässt sich weder durch 3 noch 5 noch 3 und 5 teilen'.
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
      Write: / lv_fizz.
     ELSE.
      WRITE: / lv_zahl.
    ENDIF.
ENDWHILE.
