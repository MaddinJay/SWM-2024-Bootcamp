*&---------------------------------------------------------------------*
*& Report zst_schulung_2111
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_schulung_2111.

*TYPES: t_name TYPE c LENGTH 10.
*
*DATA lv_name TYPE t_name VALUE 'Basti'.
*
*WRITE lv_name.
*
*TYPES: t_favourite_color TYPE c LENGTH 10.
*
*DATA lv_fav_color TYPE t_favourite_color VALUE 'yellow'.
*WRITE lv_fav_color.

DATA(lv_zaehler) = 1.
DO 10 TIMES.
 WRITE lv_zaehler.
 IF lv_zaehler MOD 2 EQ 0. "<Zahl> MOD 2 EQ 0 => Die Zahl ist ohne Rest durch 2 teilbar
 WRITE 'Even'.
 ELSE.
 WRITE 'Odd'.
 ENDIF.
 lv_zaehler = lv_zaehler + 1.
ENDDO.
