*&---------------------------------------------------------------------*
*& Report zfizzbuzz_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfizzbuzz_tl.
*Aufgabenstellung:

SELECTION-SCREEN BEGIN OF BLOCK name WITH FRAME TITLE TEXT-001. "Überschrift anpassen Open Others --> Text elemente
PARAMETERS p_eing TYPE int1.
SELECTION-SCREEN END OF BLOCK name.

DATA lv_counter TYPE int1 VALUE 0.
*Gibt die Zahlen von 1 bis USER EINGABE.
DO p_eing TIMES.
  lv_counter = lv_counter + 1.
IF lv_counter MOD 3 EQ 0 AND lv_counter MOD 5 EQ 0.
    WRITE: 'FizzBuzz', /.
  ELSEIF lv_counter MOD 5 EQ 0.
    WRITE: 'Buzz',  /.
  ELSEIF lv_counter MOD 3 EQ 0.
    WRITE: 'Fizz',  /.
  ELSE.
    WRITE: lv_counter,  /.
  ENDIF.
ENDDO.


*Gibt die Zahlen von USER EINGABE bis 100 an. Ändert die durch 3 geteilten Zahlen mit FIZZ und durch 5 geteilten Zahlen mit BUZZ.
*WHILE p_eing <= 100.
*  IF p_eing MOD 3 EQ 0 AND p_eing MOD 5 EQ 0.
*    WRITE / 'FizzBuzz'.
*  ELSEIF p_eing MOD 5 EQ 0.
*    WRITE / 'Buzz'.
*  ELSEIF p_eing MOD 3 EQ 0.
*    WRITE / 'Fizz'.
*  ELSE.
*    WRITE / p_eing.
*  ENDIF.
*  p_eing = p_eing + 1.
*ENDWHILE.
