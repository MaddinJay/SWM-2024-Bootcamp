*&---------------------------------------------------------------------*
*& Report zbv_aufgabe_fizz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_aufgabe_fizz.

SELECTION-SCREEN BEGIN OF BLOCK abc with FRAME TITLE TEXT-001.
PARAMETERS p_zahl TYPE int1 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK abc.

DATA lv_zahl TYPE int1 VALUE 0.

DO p_zahl TIMES.
lv_zahl = lv_zahl + 1.
IF lv_zahl MOD 15 EQ 0.
WRITE: 'Fizz Buzz', / .
ELSEIF lv_zahl MOD 5 EQ 0.
WRITE: 'Buzz', / .
ELSEIF lv_zahl MOD 3 EQ 0.
WRITE: 'Fizz', / .
ELSE.
WRITE: lv_zahl, / .
ENDIF.
ENDDO.
