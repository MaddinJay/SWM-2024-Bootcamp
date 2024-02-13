*&---------------------------------------------------------------------*
*& Report Z_FB_0000_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_0002_studenten.

**********************************************************************
* Typdefinitionen und Datendeklarationen
**********************************************************************

TYPES: BEGIN OF lty_s_studenten,                                "lty_s = lokaler Typ (Strukturtyp)
         matnr     TYPE i,
         vorname   TYPE string,
         name      TYPE string,
         studf     TYPE string,
         sem       TYPE i,
         abschluss TYPE string,
       END OF lty_s_studenten.

TYPES lty_t_studenten TYPE TABLE OF lty_s_studenten WITH KEY matnr.

DATA: gs_student TYPE lty_s_studenten,
      gt_student TYPE lty_t_studenten.

gs_student-matnr      = '00001'.
gs_student-vorname    = 'Bastian'.
gs_student-name       = 'Dötsch'.
gs_student-studf      = 'Elektrotechnik'.
gs_student-sem        = '2'.
gs_student-abschluss  = 'B.Sc'.
INSERT gs_student INTO TABLE gt_student.
CLEAR gs_student.

gs_student-matnr      = '00002'.
gs_student-vorname    = 'Timm'.
gs_student-name       = 'Esters'.
gs_student-studf      = 'W-Ingeneur'.
gs_student-sem        = '5'.
gs_student-abschluss  = 'M.Sc'.
INSERT gs_student INTO TABLE gt_student.
CLEAR gs_student.

gs_student-matnr      = '00003'.
gs_student-vorname    = 'Ben'.
gs_student-name       = 'Backes'.
gs_student-studf      = 'Versicherungen'.
gs_student-sem        = '4'.
gs_student-abschluss  = 'M.Sc'.
INSERT gs_student INTO TABLE gt_student.
CLEAR gs_student.

DELETE gt_student WHERE matnr = 2.

LOOP AT gt_student INTO gs_student.
  WRITE: 'Matrikel-Nr: ', gs_student-matnr, /,
       'Vorname: ', gs_student-vorname, /,
       'Name: ', gs_student-name, /,
       'Studienfach: ', gs_student-studf, /,
       'Semester: ', gs_student-sem, /,
       'Abschluss: ', gs_student-abschluss,/.
  ULINE.
  CLEAR gs_student.
ENDLOOP.
