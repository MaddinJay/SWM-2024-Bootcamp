*&---------------------------------------------------------------------*
*& Report zem_report1
*&---------------------------------------------------------------------*
*MSWST Berechnung nach Eingabe
*&---------------------------------------------------------------------*
REPORT zem_3woche.

**********************************************************************

PARAMETERS: p_zahl TYPE int1 OBLIGATORY.

DATA lv_v1 TYPE int1.

DO p_zahl TIMES.

  lv_v1 = sy-index.
  IF  lv_v1 MOD 15 EQ 0.
    WRITE: 'FIZZ BUZZ', /.

  ELSEIF lv_v1 MOD 3 EQ 0.
    WRITE: 'FIZZ', /.

  ELSEIF lv_v1 MOD 5 EQ 0.
    WRITE: 'BUZZ', /.

  ELSE.
    WRITE: lv_v1, /.

  ENDIF.


ENDDO.
