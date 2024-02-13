*&---------------------------------------------------------------------*
*& Report Z_FB_0000_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_0000_studenten.

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

DATA: gs_student TYPE lty_s_studenten.

gs_student-matnr      = '00001'.
gs_student-vorname    = 'Bastian'.
gs_student-name       = 'Dötsch'.
gs_student-studf      = 'Elektrotechnik'.
gs_student-sem        = '2'.
gs_student-abschluss  = 'B.Sc'.

WRITE: 'Matrikel-Nr: ', gs_student-matnr, /,
       'Vorname: ', gs_student-vorname, /,
       'Name: ', gs_student-name, /,
       'Studienfach: ', gs_student-studf, /,
       'Semester: ', gs_student-sem, /,
       'Abschluss: ', gs_student-abschluss,/.
