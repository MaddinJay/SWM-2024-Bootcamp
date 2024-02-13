*&---------------------------------------------------------------------*
*& Report zob_mb_debugging5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_debugging5.

DATA: lv_string TYPE STRING.

lv_string = '100'.

IF lv_string > 200.
  WRITE: / 'String is greater than 200'.
ELSE.
  WRITE: / 'String is not greater than 200'.
ENDIF.
