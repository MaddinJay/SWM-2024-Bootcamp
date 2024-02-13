*&---------------------------------------------------------------------*
*& Report ZMB_0000_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_0000_studenten.

TYPES: BEGIN OF lty_s_student,

         name        TYPE string,
         vorname     TYPE string,
         matrikelnr TYPE i,
         studienfach TYPE string,
         semester    TYPE i,
         abschluss   TYPE string,

       END OF lty_s_student,
       lty_t_studenten TYPE TABLE OF lty_s_student WITH KEY Matrikelnr.


DATA gs_student TYPE lty_s_student.
DATA gt_studenten TYPE lty_t_studenten.



gs_student-name =     'Butz'.
gs_student-vorname     = 'Maureen'.
gs_student-matrikelnr = 10.
gs_student-studienfach = 'Informatik'.
gs_student-semester    = '6'.
gs_student-abschluss   = 'Bachelor'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.


gs_student-name =     'Müller'.
gs_student-vorname     = 'Max'.
gs_student-matrikelnr = 11.
gs_student-studienfach = 'Medizin'.
gs_student-semester    = '10'.
gs_student-abschluss   = 'Doktor'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

gs_student-name =     'Meier'.
gs_student-vorname     = 'Peter'.
gs_student-matrikelnr = 12.
gs_student-studienfach = 'Sportwissenschaften'.
gs_student-semester    = '8'.
gs_student-abschluss   = 'Bachelor'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

Delete gt_studenten WHERE Matrikelnr = 12.
LOOP AT gt_studenten INTO gs_student.
  WRITE:
'Vorname:', gs_student-vorname, /,
'Martrikelnr:' ,gs_student-matrikelnr, /,
'Studienfach:',gs_student-Studienfach, /,
'Semester:',gs_student-semester, /,
'Abschluss:',gs_student-abschluss, /.
  CLEAR gs_student.
  ENDLOOP.
