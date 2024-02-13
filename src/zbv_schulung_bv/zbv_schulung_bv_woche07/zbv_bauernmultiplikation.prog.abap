*&---------------------------------------------------------------------*
*& Report zbv_bauernmultiplikation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_bauernmultiplikation.

DATA: lv_faktor1   TYPE p DECIMALS 0 VALUE 47,
      lv_faktor2   TYPE p DECIMALS 0 VALUE 42,
      lv_ergebnis TYPE p DECIMALS 0.


WHILE lv_faktor1 > 0.
  IF lv_faktor1 MOD 2 <> 0.
    lv_ergebnis = lv_ergebnis + lv_faktor2.
  ENDIF.

  WRITE: / lv_faktor1, lv_faktor2.
  lv_faktor1 = lv_faktor1 DIV 2 .
  lv_faktor2 = lv_faktor2 * 2.

ENDWHILE.

WRITE: / 'Gesamtergebnis:', lv_ergebnis.
