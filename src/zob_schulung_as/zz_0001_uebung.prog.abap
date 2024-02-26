*&---------------------------------------------------------------------*
*& Report ZZ_0001_UEBUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zz_0001_uebung.

**********************************************************************
* Strukturtypen lty_s_studenten erstellen
**********************************************************************
TYPES: BEGIN OF lty_s_studenten,
         name        TYPE string,
         vorname     TYPE string,
         matrnr(10)      TYPE n,
         studienfach TYPE string,
         semester    TYPE n,
         abschluss   TYPE string,
       END OF lty_s_studenten.

**********************************************************************
* Struktur gs_studenten erstellen auf Basis Strukturtyp lty_s_studenten
**********************************************************************
DATA gs_studenten TYPE lty_s_studenten.

gs_studenten-name = 'Mustermann'.
gs_studenten-vorname = 'Max'.
gs_studenten-matrnr = 0001234567.
gs_studenten-studienfach = 'Architektur'.
gs_studenten-semester = 4.
gs_studenten-abschluss = 'B.A.'.

WRITE: 'Name: ', gs_studenten-name,
 / 'Vorname', gs_studenten-vorname,
 / 'Matrikelnr.: ', gs_studenten-matrnr,
 / 'Studienfach: ', gs_studenten-studienfach,
 / 'Semester: ', gs_studenten-semester,
 / 'Abschluss: ', gs_studenten-abschluss.
