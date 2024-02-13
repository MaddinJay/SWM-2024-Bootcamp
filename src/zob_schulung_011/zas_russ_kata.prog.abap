*&---------------------------------------------------------------------*
*& Report zas_russ_kata
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_russ_kata.

PARAMETERS: p_zahl  TYPE p,
            p_zahl2 TYPE p.



DATA: lv_zahl3 TYPE i.



WHILE p_zahl > 1.
  WRITE: p_zahl, p_zahl2, /.
  IF p_zahl MOD 2 <> 0.
*    p_zahl = p_zahl / 2.
    p_zahl = round( val = p_zahl / 2 DEC = 1 mode = cl_abap_math=>round_down ).
    p_zahl2 = p_zahl2 * 2.
    lv_zahl3 = lv_zahl3 + p_zahl2.
    WRITE: p_zahl, lv_zahl3, /.
  ELSE.
    p_zahl = p_zahl / 2.
*    lv_zahl3 = lv_zahl3 + p_zahl2.
    WRITE: p_zahl, lv_zahl3, /.
  ENDIF.
ENDWHILE.
