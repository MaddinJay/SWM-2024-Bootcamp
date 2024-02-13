*&---------------------------------------------------------------------*
*& Report zuh_debugging8
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_debugging8.
tables mara.


Types: BEGIN OF ty_material,
 matnr TYPE matnr,
 maktx TYPE maktx,
 END OF ty_material.
DATA: lt_materials TYPE TABLE OF ty_material,
 ls_material TYPE ty_material.

SELECT
 FROM mara
 fields
matnr
 INTO TABLE @lt_materials
 UP TO 10 ROWS.
LOOP AT lt_materials into ls_material.
 WRITE: / ls_material-matnr, ls_material-maktx.
ENDLOOP.
