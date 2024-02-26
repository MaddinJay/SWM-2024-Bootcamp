*&---------------------------------------------------------------------*
*& Report ZTW_HALLO_WELT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTW_HALLO_WELT.
DATA gv_name TYPE string.

gv_name = 'Klaus'.

*WRITE: 'Hallo Welt!'.
Write gv_name.

DATA: lv_ergebnis TYPE i,
          lv_value1 TYPE i VALUE 5,
          lv_value2 TYPE i VALUE 3.
          lv_value2 = 4.
lv_ergebnis = lv_value1 + lv_value2.

WRITE: lv_ergebnis.
