*&---------------------------------------------------------------------*
*& Report zfd_abap_debug1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_abap_debug1.

DATA(lv_test) = |Test|.  " PIPE SYMBOL |
lv_test = 'Dies ist ein Test'.
WRITE lv_test.
