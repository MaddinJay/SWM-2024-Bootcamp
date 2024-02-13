*&---------------------------------------------------------------------*
*& Report zas_uebung04_woche3_fizzbuzz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_uebung04_woche3_fizzbuzz.

PARAMETERS p_wert TYPE i OBLIGATORY.

IF p_wert MOD 3 EQ 0 AND p_wert MOD 5 EQ 0.
  WRITE 'fizzbuzz'.
ELSEIF p_wert MOD 5 EQ 0.
  WRITE 'buzz'.
ELSEIF p_wert MOD 3 EQ 0.
  WRITE 'fizz'.
ELSE.
  WRITE p_wert.
ENDIF.

*IF p_wert < 1 OR p_wert > 100.
*  DATA(lv_message) = 'Bitte einen Wert zwischen 1 und 100 eingeben.'.
*  MESSAGE lv_Message TYPE 'W' DISPLAY LIKE 'I'.
*ENDIF.
*
*DATA: p_erg3 TYPE i, p_erg5 TYPE i, p_do TYPE i, p_do3 TYPE i, p_do5 TYPE i.
*
*p_erg3 = p_wert MOD 3.
*p_erg5 = p_wert MOD 5.
*
*
**IF p_erg3 = 0 AND p_erg5 = 0.
**  WRITE 'fizzbuzz'.
**ELSEIF p_erg5 = 0.
**  WRITE 'buzz'.
**ELSEIF p_erg3 = 0.
**  WRITE 'fizz'.
**ELSE.
**  WRITE p_wert.
**ENDIF.
