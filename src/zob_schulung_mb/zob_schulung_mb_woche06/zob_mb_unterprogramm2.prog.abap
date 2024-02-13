*&---------------------------------------------------------------------*
*& Report zob_mb_unterprogramm2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_unterprogramm2.



START-OF-SELECTION.
DATA: lv_result TYPE int1.


PERFORM zomb_bigger IN PROGRAM zob_mb_unterprogramm

USING 5 15 CHANGING lv_result.
WRITE lv_result.
