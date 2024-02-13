*&---------------------------------------------------------------------*
*& Report ZEM_HALLO_WELT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEM_HALLO_WELT.

DATA gv_wschimpf TYPE string VALUE 'Schnauze'.
DATA gv_schimpf TYPE string VALUE 'halt die'.

gv_schimpf = 'Hunde'.

WRITE gv_schimpf.
WRITE gv_wschimpf.
