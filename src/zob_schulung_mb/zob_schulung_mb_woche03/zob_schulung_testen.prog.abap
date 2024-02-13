*&---------------------------------------------------------------------*
*& Report zob_schulung_testen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_schulung_testen.

*Usereingabe bis 100
*parameters p_button type int1.
*
*
*while p_button <= 100.
*If p_button Mod 3 EQ 0 and p_button Mod 5 EQ 0.
*write / 'FizzBuzz'.
*elseif p_button Mod 5 EQ 0.
*write / 'Buzz'.
*elseif p_button Mod 3 EQ 0.
*Write / 'Fizz'.
*else.
*write / p_button.
*endif.
*p_button = p_button + 1.
*endwhile.

*1 bis Usereingabe
PARAMETERS p_eing TYPE int1.
DATA lv_counter TYPE int1 VALUE 0.
DO p_eing TIMES.
lv_counter = lv_counter + 1.
IF lv_counter MOD 3 EQ 0 AND lv_counter MOD 5 EQ 0.
    WRITE / 'FizzBuzz'.
  ELSEIF lv_counter MOD 5 EQ 0.
    WRITE / 'Buzz'.
  ELSEIF lv_counter MOD 3 EQ 0.
    WRITE / 'Fizz'.
  ELSE.
    WRITE / lv_counter.
  ENDIF.

ENDDO.
