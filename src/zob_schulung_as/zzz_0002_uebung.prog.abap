*&---------------------------------------------------------------------*
*& Report ZZZ_0002_UEBUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zzz_0002_uebung.
**********************************************************************
* Strukturdeklaration
**********************************************************************
TYPES: BEGIN OF lty_s_studenten,
         name(20)        TYPE c,
         vorname(20)     TYPE c,
         matrnr(10)      TYPE n,
         studienfach(20) TYPE c,
         semester(1)     TYPE n,
         abschluss(10)   TYPE c,
       END OF lty_s_studenten.

TYPES lty_t_studenten TYPE TABLE OF lty_s_studenten.

*DATA gt_studenten TYPE lty_t_studenten.
DATA gs_studenten TYPE lty_s_studenten.
DATA gt_studenten TYPE SORTED TABLE OF lty_s_studenten WITH UNIQUE KEY matrnr.

gs_studenten-name = 'Mustermann'.
gs_studenten-vorname = 'Max'.
gs_studenten-matrnr = 0001234567.
gs_studenten-studienfach = 'Architektur'.
gs_studenten-semester = 4.
gs_studenten-abschluss = 'B.A.'.
APPEND gs_studenten to gt_studenten.
CLEAR gt_studenten.
*gs_studenten-name = 'Meier'.
*gs_studenten-vorname = 'Marius'.
*gs_studenten-matrnr = 0000000999.
*gs_studenten-studienfach = 'Informatik'.
*gs_studenten-semester = 2.
*gs_studenten-abschluss = 'M.Sc.'.
*APPEND gs_studenten to gt_studenten.


*WRITE: 'Name: ', gs_studenten-name,
* / 'Vorname', gs_studenten-vorname,
* / 'Matrikelnr.: ', gs_studenten-matrnr,
* / 'Studienfach: ', gs_studenten-studienfach,
* / 'Semester: ', gs_studenten-semester,
* / 'Abschluss: ', gs_studenten-abschluss.
