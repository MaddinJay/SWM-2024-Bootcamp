*&---------------------------------------------------------------------*
*& Report zuh_debugging1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_debugging1.
*DATA lv_test type string Value 'Test'.    "es wurde DAT stat DATA geschrieben.
*oder:
DATA(lv_test) = |Test|.
lv_test = 'Dies ist ein Test'.
WRITE lv_test.
*******************************************************
