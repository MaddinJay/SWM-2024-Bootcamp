*&---------------------------------------------------------------------*
*& Report ZBV_0000_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBV_0000_STUDENTEN.

TYPES: BEGIN OF lty_s_student,
  name TYPE string,
  vorname TYPE string,
  matrikelnr TYPE i,
  studienfach TYPE string,
  semester TYPE i,
  abschluss TYPE string,
  END OF lty_s_student,
  lty_t_studenten TYPE TABLE OF lty_s_student WITH KEY matrikelnr.

DATA: gs_student TYPE lty_s_student,
      gt_studenten TYPE lty_t_studenten.

gs_student-name = 'Mustermann'.
gs_student-vorname = 'Max'.
gs_student-matrikelnr = 1.
gs_student-studienfach = 'Architektur'.
gs_student-semester = 4.
gs_student-abschluss = 'B.A.'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

gs_student-name = 'Mueller'.
gs_student-vorname = 'Alex'.
gs_student-matrikelnr = 2.
gs_student-studienfach = 'Architektur'.
gs_student-semester = 6.
gs_student-abschluss = 'B.A.'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

gs_student-name = 'Meyer'.
gs_student-vorname = 'Tom'.
gs_student-matrikelnr = 3.
gs_student-studienfach = 'Architektur'.
gs_student-semester = 5.
gs_student-abschluss = 'B.A.'.
INSERT gs_student INTO TABLE gt_studenten.
CLEAR gs_student.

DELETE gt_studenten WHERE Matrikelnr = 2.

LOOP AT gt_studenten INTO gs_student.
WRITE:  'Name:', gs_student-name, /,
        'Vorname', gs_student-vorname, /,
        'Martikelnr.', gs_student-matrikelnr, /,
        'Studienfach:', gs_student-studienfach, /,
        'Semester', gs_student-semester, /,
        'Abschluss',gs_student-abschluss.
 CLEAR gs_student.
ENDLOOP.
