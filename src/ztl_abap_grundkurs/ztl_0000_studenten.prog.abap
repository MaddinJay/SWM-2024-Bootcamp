*&---------------------------------------------------------------------*
*& Report ZTL_0000_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_0000_studenten.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Übung Strukturen und Strukturtypen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*TYPES: BEGIN OF lty_s_student,
*                name        TYPE string,
*                vorname     TYPE string,
*                matrikelnr  TYPE i,
*                studienfach TYPE string,
*                semester    TYPE i,
*                abschluss   TYPE string,
*  END OF lty_s_student.

*DATA: gs_student TYPE lty_s_student.

*gs_student-name = 'Mueller'.
*gs_student-vorname = 'Alex'.
*gs_student-matrikelnr = 1.
*gs_student-studienfach = 'Architektur'.
*gs_student-semester = 4.
*gs_student-abschluss = 'M.Sc.'.

*WRITE: 'Name: ',        gs_student-name, /,
*      'Vorname: ',     gs_student-vorname, /,
*      'Matrikelnr.: ', gs_student-matrikelnr, /,
*      'Studienfach: ', gs_student-studienfach, /,
*      'Semester: ',    gs_student-semester, /,
*      'Abschluss: ',   gs_student-abschluss, /.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Übung:Interne Tabellen und Tabellentypen:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
TYPES: BEGIN OF lty_s_student,
         name        TYPE string,
         vorname     TYPE string,
         matrikelnr  TYPE i,
         studienfach TYPE string,
         semester    TYPE i,
         abschluss   TYPE string,
       END OF lty_s_student,
       lty_t_student TYPE TABLE OF lty_s_student WITH KEY matrikelnr.

DATA: gs_student   TYPE lty_s_student,
      gt_studenten TYPE lty_t_student.

gs_student-name = 'Mueller'.
gs_student-vorname = 'Alex'.
gs_student-matrikelnr = 1.
gs_student-studienfach = 'Architektur'.
gs_student-semester = 4.
gs_student-abschluss = 'M.Sc.'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

gs_student-name = 'Meyer'.
gs_student-vorname = 'Tom'.
gs_student-matrikelnr = 2.
gs_student-studienfach = 'Physic'.
gs_student-semester = 6.
gs_student-abschluss = 'B.Sc.'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

gs_student-name = 'Holtmann'.
gs_student-vorname = 'Dieter'.
gs_student-matrikelnr = 3.
gs_student-studienfach = 'Mathematik'.
gs_student-semester = 2.
gs_student-abschluss = 'Prof. Dr.'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

DELETE gt_studenten WHERE matrikelnr = 2. "lösch bitte den Eintrag aus der Tabelle wo Matrikelnr. 2 steht.

LOOP AT gt_studenten INTO gs_student.
  WRITE: 'Name: ',        gs_student-name, /,
  'Vorname: ',     gs_student-vorname, /,
  'Matrikelnr.: ', gs_student-matrikelnr, /,
  'Studienfach: ', gs_student-studienfach, /,
  'Semester: ',    gs_student-semester, /,
  'Abschluss: ',   gs_student-abschluss, /.
  ULINE.
  CLEAR gs_student. "Tabelle wird befüllt und korrigiert und der Student Eintrag mit Martikelnr 2 gelöscht. Es werden nur 2 Studenten ausgegeben.
ENDLOOP.
