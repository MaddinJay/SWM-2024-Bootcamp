*&---------------------------------------------------------------------*
*& Report ZEM_TAB_ANL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_tab_anl.

TYPES: BEGIN OF ls_lstruktur,
         vorname  TYPE string,
         nachname TYPE string,
       END OF ls_lstruktur.


TYPES lt_ltabelle TYPE TABLE OF ls_lstruktur.


DATA: gs_gstruktur type ls_lstruktur.
DATA: gt_gtabelle TYPE lt_ltabelle.
Types gt_gtabelle Type SORTED TABLE OF ls_lstruktur WITH UNIQUE KEY vorname.


gs_gstruktur-vorname = 'Sick'.
gs_gstruktur-nachname = 'Hole'.
INSERT gs_gstruktur INTO gt_gtabelle INDEX 1.

Write: gs_gstruktur-vorname, gs_gstruktur-nachname.
