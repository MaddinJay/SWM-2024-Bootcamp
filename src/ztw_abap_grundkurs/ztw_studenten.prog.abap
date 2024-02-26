*&---------------------------------------------------------------------*
*& Report ZTW_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_studenten.

TYPES: BEGIN OF lty_s_student,
         name       TYPE string,
         vorname    TYPE string,
         matrikelnr TYPE i,
         abschluss  TYPE string,
       END OF      lty_s_student,
       lty_t_studenten TYPE STANDARD TABLE OF lty_s_student WITH KEY matrikelnr.

DATA: gs_student   TYPE lty_s_student,
      gt_studenten TYPE lty_t_studenten.


gs_student-name = 'Mustermann'.
gs_student-vorname = 'Max'.
gs_student-matrikelnr = 1.
gs_student-abschluss = 'M.Sc.'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

gs_student-name = 'Meyer'.
gs_student-vorname = 'Tom'.
gs_student-matrikelnr = 2.
gs_student-abschluss = 'B. Sc.'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

gs_student-name = 'Holtmann'.
gs_student-vorname = 'Dieter'.
gs_student-matrikelnr = 3.
gs_student-abschluss = 'Prof. Dr.'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

DELETE gt_studenten WHERE matrikelnr = 2.

LOOP AT gt_studenten INTO gs_student.
  WRITE: 'Name: ', gs_student-name, /,
         'Vorname: ', gs_student-vorname, /,
         'Matrikelnr: ', gs_student-matrikelnr, /,
         'Abschluss: ', gs_student-abschluss, /.
  CLEAR gs_student.
ENDLOOP.

*WRITE: 'Name: ', gs_student-name, /,
*       'Vorname: ', gs_student-vorname, /,
*       'Matrikelnr: ', gs_student-matrikelnr, /,
*       'Abschluss: ', gs_student-abschluss, /.



























*TYPES: BEGIN OF lty_s_freund,
*         name         TYPE string,
*         vorname      TYPE string,
*         alter        TYPE i,
*         groesse      TYPE i,
*         geschlecht   TYPE string,
*         beruf        TYPE string,
*         schuhgroesse TYPE i,
*       END OF lty_s_freund.
*
*DATA: gs_freund TYPE lty_s_freund.
*
*gs_freund-name = 'Peter'.
*gs_freund-vorname = 'Andreas'.
*gs_freund-alter = 29.
*gs_freund-groesse = 181.
*gs_freund-geschlecht = 'Männlich'.
*gs_freund-beruf = 'Speditionskaufmann'.
*gs_freund-schuhgroesse = 45.
*
*WRITE: 'Name: ', gs_freund-name, /,
*'Voraname: ', gs_freund-vorname, /,
*'Alter: ', gs_freund-alter, /,
*'Größe: ', gs_freund-groesse, /,
*'Geschlecht: ', gs_freund-geschlecht, /,
*'Beruf: ', gs_freund-beruf, /,
*'Schuhgröße: ', gs_freund-schuhgroesse.
