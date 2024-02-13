*&---------------------------------------------------------------------*
*& Report ZUH_0000_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_0000_studenten.

TYPES: BEGIN OF lty_s_studenten,
         name           TYPE string,
         vorname        TYPE string,
         matrikelnr(10) TYPE n,
         studienfach    TYPE string,
         semester       TYPE i,
         abschluss      TYPE string,

       END OF lty_s_studenten.

DATA gs_studenten TYPE lty_s_studenten.

gs_studenten-name = 'Mustermann'.
gs_studenten-vorname = 'Max'.
gs_studenten-matrikelnr = 1234567.
gs_studenten-studienfach = 'Architektur'.
gs_studenten-semester = 4.
gs_studenten-abschluss = 'B.A.'.

WRITE:  'Name: ', gs_studenten-name,
       / 'Vorname: ' , gs_studenten-vorname,
       / 'Martikelnr.:' , gs_studenten-matrikelnr,
       / 'Studienfach.:' , gs_studenten-Studienfach,
       / 'Semester: ' , gs_studenten-Semester,
       / 'Abschluss: ' , gs_studenten-Abschluss.
