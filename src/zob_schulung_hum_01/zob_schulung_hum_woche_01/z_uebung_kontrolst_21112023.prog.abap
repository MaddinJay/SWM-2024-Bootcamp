*&---------------------------------------------------------------------*
*& Report z_uebung_kontrolst_21112023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_kontrolst_21112023.

DATA(lv_zaehler) = 0.

WHILE lv_zaehler < 10.
WRITE lv_zaehler.
lv_zaehler = lv_zaehler + 1.
ENDWHILE.
WRITE / lv_zaehler.

DATA(lv_zaehler1) = 0.
DO 10 TIMES.
lv_zaehler1 = lv_zaehler1 + 1.
WRITE  lv_zaehler1.
ENDDO.

DATA(lv_zahler2) = 0.
