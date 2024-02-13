*&---------------------------------------------------------------------*
*& Report ZFD_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_studenten.

**********************************************************************
*Definieren der Struktur und des Tabellentyps
**********************************************************************
TYPES: BEGIN OF lty_s_student,
         name           TYPE string,
         vorname        TYPE string,
         matrikelnr(10) TYPE n,
         studienfach    TYPE string,
         semester       TYPE i,
         abschluss      TYPE string,
       END OF lty_s_student.

TYPES lty_t_studenten TYPE TABLE OF lty_s_student.

**********************************************************************
*Erstellen der Struktur, Tabelle
**********************************************************************
DATA gs_student TYPE lty_s_student.
DATA gt_studenten TYPE SORTED TABLE OF lty_s_student WITH UNIQUE KEY matrikelnr.

**********************************************************************
*Attribute belegen
**********************************************************************
gs_student-name = 'Eiben'.
gs_student-vorname = 'Guido'.
gs_student-matrikelnr = 5001.
gs_student-studienfach = 'Kunstgeschichte'.
gs_student-semester = 1.
gs_student-abschluss = 'ohne Abschluss'.
APPEND gs_student TO gt_studenten.
*INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

gs_student-name = 'Grob'.
gs_student-vorname = 'Christian'.
gs_student-matrikelnr = 5002.
gs_student-studienfach = 'Betriebswirtschaft'.
gs_student-semester = 4.
gs_student-abschluss = 'Bachelor'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

gs_student-name = 'Regler'.
gs_student-vorname = 'Marius'.
gs_student-matrikelnr = 5003.
gs_student-studienfach = 'Griechische Mythologie'.
gs_student-semester = 7.
gs_student-abschluss = 'Master'.
APPEND gs_student TO gt_studenten.
*INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

**********************************************************************
*einen Studenten löschen.
**********************************************************************
DELETE gt_studenten INDEX 1.

**********************************************************************
*Ausgabe mit Write
**********************************************************************
*ULINE (100).
LOOP AT gt_studenten INTO gs_student.
  WRITE: /'Name: ', gs_student-name.
  WRITE: /'Vorname:', gs_student-vorname.
  WRITE: /'Matrikelnr.: ', gs_student-matrikelnr.
  WRITE: /'Studienfach: ', gs_student-studienfach.
  WRITE: /'Semester: ', gs_student-semester .
  WRITE: /'Abschluss: ', gs_student-abschluss, /.

  CLEAR gs_student.
endloop.

*WRITE: /'Name: ', gs_student-name.
*WRITE: /'Vorname:', gs_student-vorname.
*WRITE: /'Matrikelnr.: ', gs_student-matrikelnr.
*WRITE: /'Studienfach: ', gs_student-studienfach.
*WRITE: /'Semester: ', gs_student-semester .
*WRITE: /'Abschluss: ', gs_student-abschluss.
