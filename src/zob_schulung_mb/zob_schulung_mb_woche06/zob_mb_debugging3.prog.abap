*&---------------------------------------------------------------------*
*& Report zob_mb_debugging3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_debugging3.


DATA lv_status TYPE c LENGTH 1.
lv_status = 'A'.

CASE lv_status.
  WHEN 'A' OR 'B'.
    WRITE: / 'Status A oder B'.
  WHEN 'C'.
    WRITE: / 'Status C'.
  WHEN OTHERS.
    WRITE: / 'Unbekannter Status'.
ENDCASE.
