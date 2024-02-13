*&---------------------------------------------------------------------*
*& Report zuh_debugging7
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_debugging7.

DATA: lv_string TYPE i.       "von string auf i geändert
lv_string = 100.
IF lv_string > 200.
 WRITE: / 'String is greater than 200'.
ELSE.
 WRITE: / 'String is not greater than 200'.
ENDIF.
