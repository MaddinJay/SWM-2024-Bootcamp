*&---------------------------------------------------------------------*
*& Report ZST_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZST_TEST.

DATA: lv_ergebnis TYPE i,
          lv_value1 TYPE i VALUE 5,
          lv_value2 TYPE i VALUE 3.
          lv_value2 = 4.
lv_ergebnis = lv_value1 + lv_value2.

WRITE lv_ergebnis.
