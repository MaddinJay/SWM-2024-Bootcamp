*&---------------------------------------------------------------------*
*& Report ZEA_UEBUNG_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEA_UEBUNG_STUDENTEN.

**********************************************************************
*Übung zu Strukturen und Tabelle, als erstes die Struktur eines Studenten:
**********************************************************************

TYPES: BEGIN OF lty_s_studenten,
  vorname TYPE string,
  name    TYPE string,
  matrnr  TYPE i,
  stufa   TYPE string,
  semes   TYPE i,
  absch   TYPE string,
END OF lty_s_studenten,
lty_t_studenten TYPE TABLE OF lty_s_studenten WITH KEY matrnr. "Tabelle definiert mit Schlüssel der Matrikelnummer"



DATA: gs_studenten TYPE lty_s_studenten,
      gt_student TYPE lty_t_studenten.


     gs_studenten-vorname     = 'Max'.
     gs_studenten-name        = 'Mustermann'.
     gs_studenten-matrnr      = 11.
     gs_Studenten-stufa       = 'Architektur'.
     gs_studenten-semes       = 4.
     gs_studenten-absch       = 'B.A.'.
     INSERT gs_studenten INTO TABLE gt_student.
     CLEAR gs_studenten.

     gs_studenten-vorname     = 'Tom'.
     gs_studenten-name        = 'Mayer'.
     gs_studenten-matrnr      = 12.
     gs_Studenten-stufa       = 'Architektur'.
     gs_studenten-semes       = 4.
     gs_studenten-absch       = 'B.A.'.
     INSERT gs_studenten INTO TABLE gt_student.
     CLEAR gs_studenten.

     gs_studenten-vorname     = 'Manfred'.
     gs_studenten-name        = 'Müller'.
     gs_studenten-matrnr      = 13.
     gs_Studenten-stufa       = 'Wissenschaften'.
     gs_studenten-semes       = 4.
     gs_studenten-absch       = 'M. Sc.'.
     INSERT gs_studenten INTO TABLE gt_student.
     CLEAR gs_studenten.

     cl_demo_output=>display( gt_student ).

*     DELETE gt_student WHERE matrnr = 12.
*
*     LOOP AT gt_student INTO gs_studenten.
*          WRITE: gs_studenten-vorname, / gs_studenten-name, / gs_studenten-matrnr, / gs_studenten-stufa, / gs_studenten-semes, / gs_studenten-absch, /.
*          CLEAR gs_studenten.
*     ENDLOOP.
*
*
*
*
*WRITE: gs_studenten-vorname, / gs_studenten-name, / gs_studenten-matrnr, / gs_studenten-stufa, / gs_studenten-semes, / gs_studenten-absch, /.
