*&---------------------------------------------------------------------*
*& Report zob_report_od_kontrolstruktur
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_kontrolstruktur.

*DATA(lv_zaehler) = 0.
*WHILE lv_zaehler =< 10.
*  WRITE: /, lv_zaehler. lv_zaehler = lv_zaehler + 1.
*  IF lv_zaehler MOD 2 EQ 0.
*    WRITE 'even'.
*  ELSE.
*    WRITE 'odd'.
*  ENDIF.
*ENDWHILE.

DATA(lv_zaehler) = 1.
WHILE lv_zaehler =< 100.
 lv_zaehler = lv_zaehler + 1.
  IF lv_zaehler MOD 3 EQ 0.
    WRITE 'teilbar durch 3 ohne Rest'.
  ELSE.
    WRITE 'nicht teilbar durch 3 ohne Rest'.
  ENDIF.
  WRITE: lv_zaehler, /.

ENDWHILE.

**DATA(lv_zaehler) = 0.
*DO 10 TIMES.
*  WRITE lv_zaehler. lv_zaehler = lv_zaehler + 1.
*ENDDO.





*DO 11 TIMES.
*  WRITE: /, lv_zaehler.
*  IF lv_zaehler MOD 2 EQ 1.
*    WRITE 'Even'.
*  ELSE.
*    WRITE 'Odd'.
*  ENDIF.
*  lv_zaehler = lv_zaehler + 1.
*ENDDO.
