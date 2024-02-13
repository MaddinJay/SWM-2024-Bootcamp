*&---------------------------------------------------------------------*
*& Report zalsu_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalsu_test.

DATA: lv_zeile TYPE i,
      lt_table type standard table of zalsu_DB_sb.
*DESCRIBE TABLE lt_table LINES lv_zeile.
*
*WRITE lv_zeile.
