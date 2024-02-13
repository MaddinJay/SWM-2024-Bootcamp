*&---------------------------------------------------------------------*
*& Report zob_uebung_extra5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_extra5.

*Geben sie das kleine Einmaleins aus.



DATA: lv_zahl1 TYPE I VALUE 1,
      lv_zahl2 TYPE I VALUE 1,
      lv_erg TYPE I.

DO 10 TIMES.
  DO 10 TIMES.
    lv_erg = lv_zahl1 * lv_zahl2.
    WRITE: / lv_zahl1, 'x', lv_zahl2, '=', lv_erg.
    lv_zahl2 = lv_zahl2 + 1.
  ENDDO.
  lv_zahl1 = lv_zahl1 + 1.
  lv_zahl2 = 1.
ENDDO.
