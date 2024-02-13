*&---------------------------------------------------------------------*
*& Report zob_hum_rus_bauernmulti
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_hum_rus_bauernmulti.

PARAMETERS: p_zahl1 TYPE p DECIMALS 0,
            p_zahl2 TYPE p DECIMALS 0.

DATA: gv_start1         TYPE p DECIMALS 0,
      gv_start2         TYPE p DECIMALS 0,
      gv_ergebnis2      TYPE p DECIMALS 0,
      gv_ergebnisgesamt TYPE p DECIMALS 0.


gv_start1 = P_zahl1.
gv_start2 = p_zahl2.

WRITE: gv_start1, gv_start2.

WHILE gv_start1 > 0.

  IF gv_start1 MOD 2 = 0.

  ELSE.
    gv_ergebnisgesamt = gv_ergebnisgesamt + gv_start2 .
  ENDIF.

  WRITE: / gv_start1, gv_start2.

  gv_start1 = gv_start1 DIV 2.
  gv_start2 = gv_start2  * 2.


ENDWHILE.

WRITE: / 'Gesamtergebnis:', gv_ergebnisgesamt.
