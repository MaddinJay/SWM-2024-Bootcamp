*&---------------------------------------------------------------------*
*& Report z_fb_tag3_fuba_uebung2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_tag3_fuba_uebung2.

DATA: lv_ergebnis TYPE int4.

CALL FUNCTION 'Z_TL_FM'
EXPORTING ip_zahl = 7
IMPORTING
          ep_ergebnis = lv_ergebnis.

WRITE lv_ergebnis.


****DATA: lt_fibonacci TYPE TABLE OF I.
****
****" Funktionsbaustein aufrufen und Fibonacci-Zahlen berechnen
****CALL FUNCTION 'Z_CALCULATE_FIBONACCI'
****  TABLES
****    et_fibonacci = lt_fibonacci.
****
****" Ausgabe der berechneten Fibonacci-Zahlen
****WRITE: / 'Fibonacci-Zahlen bis 15:', /.
****
****LOOP AT lt_fibonacci INTO DATA(lv_fibonacci).
****  WRITE: / lv_fibonacci.
****ENDLOOP.
