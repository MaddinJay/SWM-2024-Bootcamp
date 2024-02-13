*&---------------------------------------------------------------------*
*& Report zbl_funktionsbausteinausgabe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_funktionsbausteinausgabe.

DATA: lv_result TYPE int4.

 CALL FUNCTION 'Z_OBBL_FM'

 EXPORTING
 ip_basis = 5
 ip_exponent = 7
 IMPORTING
 ep_result = lv_result.
WRITE lv_result.
