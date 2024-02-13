*&---------------------------------------------------------------------*
*& Report zuh_konrollstrukturen2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_konrollstrukturen2.

DATA(lv_zaehler) = 1.
WHILE lv_zaehler <= 10.
  IF lv_zaehler MOD 2 EQ 0.
    WRITE: / , lv_zaehler, 'even'.
  ELSE .
    WRITE: /, lv_zaehler, 'odd'.
  ENDIF.
  lv_zaehler = lv_zaehler + 1.
ENDWHILE.
