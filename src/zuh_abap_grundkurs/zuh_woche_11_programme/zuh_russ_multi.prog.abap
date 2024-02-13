*&---------------------------------------------------------------------*
*& Report zuh_russ_multi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_russ_multi.

Parameters: p_zahl1 type p OBLIGATORY.
Parameters: p_zahl2 type p OBLIGATORY.


DATA: lv_zahl1 type p,
      lv_zahl2 type p,
      lv_ergebnis TYPE p.

      lv_zahl1 = p_zahl1.
      lv_zahl2 = p_zahl2.

WHILE lv_zahl1 > 1.
  IF lv_zahl1 = 1.
    lv_ergebnis = lv_ergebnis + lv_zahl2.
    EXIT.
  ELSE.
  lv_zahl1 = floor( lv_zahl1 / 2 ).
    lv_zahl2 = lv_zahl2 * 2.
    IF lv_zahl1 MOD 2 >< 0.
      lv_ergebnis = lv_ergebnis + lv_zahl2.
    ELSE.
    lv_ergebnis = lv_ergebnis.
    ENDIF.

  ENDIF.
  ENDWHILE.


  write lv_ergebnis.
