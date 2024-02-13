*&---------------------------------------------------------------------*
*& Report zob_mb_funktionsbaustein
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_funktionsbaustein.



DATA: lv_result TYPE int4.

CALL FUNCTION 'ZOBMB_FM_003'
 EXPORTING
 ip_basis = 5
 ip_exponent = 7
 IMPORTING
 ep_result = lv_result.

 WRITE lv_result.
