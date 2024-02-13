*&---------------------------------------------------------------------*
*& Report ZOD_0000_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOD_0000_STUDENTEN.

TYPES: BEGIN OF lty_s_studenten,
  name TYPE string,
  vorname TYPE string,
  matrikelnr(10) TYPE n,
  studienfach TYPE string,
  semester   TYPE i,
  abschluss TYPE string,
  END OF lty_s_studenten.

TYPES lty_t_studenten TYPE TABLE OF lty_s_studenten.

DATA gs_studenten TYPE lty_s_studenten.
DATA gt_studenten TYPE SORTED TABLE OF lty_s_studenten WITH UNIQUE KEY matrikelnr.

  gs_studenten-name = 'Mustermann'.
  gs_studenten-vorname ='Max'.
  gs_studenten-matrikelnr = 1234567.
  gs_studenten-studienfach = 'Architektur'.
  gs_studenten-semester = 4.
  gs_studenten-abschluss = 'B.A'.
*APPEND gs_studenten TO gt_studenten2.
INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

  gs_studenten-name = 'Meier'.
  gs_studenten-vorname ='Marius'.
  gs_studenten-matrikelnr = 999.
  gs_studenten-studienfach = 'Informatik'.
  gs_studenten-semester = 2.
  gs_studenten-abschluss = 'M. Sc'.

*APPEND gs_studenten TO gt_studenten2.
 INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

  gs_studenten-name = 'ODT'.
  gs_studenten-vorname ='Orlando'.
  gs_studenten-matrikelnr = 17.
  gs_studenten-studienfach = 'BWL'.
  gs_studenten-semester = 1.
  gs_studenten-abschluss = 'M. Sc'.

*APPEND gs_studenten TO gt_studenten2.
 INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

  gs_studenten-name = 'Moreno'.
  gs_studenten-vorname ='Carlos'.
  gs_studenten-matrikelnr = 99.
  gs_studenten-studienfach = 'Soziologie'.
  gs_studenten-semester = 3.
  gs_studenten-abschluss = 'M. Sc'.

*APPEND gs_studenten TO gt_studenten2.
 INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

  gs_studenten-name = 'Hoffmann'.
  gs_studenten-vorname ='Uwe'.
  gs_studenten-matrikelnr = 66.
  gs_studenten-studienfach = 'Informatik'.
  gs_studenten-semester = 2.
  gs_studenten-abschluss = 'M. Sc'.

*APPEND gs_studenten TO gt_studenten2.
 INSERT gs_studenten INTO TABLE gt_studenten.

DELETE gt_studenten INDEX 3.
*DELETE gt_studenten2 WHERE name = 'Hoffman'.
CLEAR gs_studenten.

LOOP AT gt_studenten INTO gs_studenten.
 WRITE: 'Name: ', gs_studenten-name, /, 'Vorname: ', gs_studenten-vorname, /, 'Matrikelnr.: ', gs_studenten-matrikelnr, /, 'Studienfach: ', gs_studenten-studienfach, /, 'Semester: ',
  gs_studenten-semester, /, 'Absschluss: ', gs_studenten-abschluss, /.
CLEAR gs_studenten.
ENDLOOP.
*
*  WRITE: 'Name: ', gs_studenten-name, /, 'Vorname: ', gs_studenten-vorname, /, 'Matrikelnr.: ', gs_studenten-matrikelnr, /, 'Studienfach: ', gs_studenten-studienfach, /, 'Semester: ',
*  gs_studenten-semester, /, 'Absschluss: ', gs_studenten-abschluss.
