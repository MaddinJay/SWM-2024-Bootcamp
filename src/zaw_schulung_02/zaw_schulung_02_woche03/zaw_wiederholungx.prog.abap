*&---------------------------------------------------------------------*
*& Report zaw_wiederholungx
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_wiederholungx.

*data(lv_var) = 'Hallo 123'.
*lv_var = 'Hallo'.
*
*write lv_var.


SELECT COUNT( name )
FROM stravelag
INTO @DATA(lv_count).

WRITE: |Anzahl der Eintrage: { lv_count }|.


MESSAGE 'Einträge wurden ausgegeben.' TYPE 'i'.
