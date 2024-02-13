*&---------------------------------------------------------------------*
*& Report zas_grundlagen_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_grundlagen_extra.

*TYPES: BEGIN OF ls_struktur,
*         id       TYPE n LENGTH 3,
*         vorname  TYPE string,
*         nachname TYPE c,
*         alter    TYPE n LENGTH 2,
*       END OF ls_struktur.
*
*DATA gs_struktur TYPE ls_struktur.
*DATA gt_struktur TYPE TABLE OF ls_struktur.
*
*gs_struktur-id = '121'.
*gs_struktur-vorname = 'Ahmet'.
*gs_struktur-nachname = 'Sevli'.
*gs_struktur-alter = '28'.
*APPEND gs_struktur TO gt_struktur.
*
*gs_struktur-id = '532'.
*gs_struktur-vorname = 'George'.
*gs_struktur-nachname = 'Struz'.
*gs_struktur-alter = '58'.
*APPEND gs_struktur TO gt_struktur.
*
*WRITE: gs_struktur-id, gs_struktur-vorname, gs_struktur-nachname, gs_struktur-alter.

TYPES: BEGIN OF ls_struktur,
         lv_euro   TYPE i,
         lv_dollar TYPE p DECIMALS 2,
       END OF ls_struktur.

DATA gs_struktur TYPE ls_struktur.
DATA gt_Struktur TYPE TABLE OF ls_struktur.

CONSTANTS lv_kurs TYPE p VALUE '1.19' DECIMALS 2.

WHILE gs_struktur-lv_euro <= 100.
  gs_struktur-lv_euro += 1.
  gs_struktur-lv_dollar = gs_struktur-lv_euro * lv_kurs.
  WRITE: / gs_struktur-lv_euro, gs_struktur-lv_dollar.
ENDWHILE.
