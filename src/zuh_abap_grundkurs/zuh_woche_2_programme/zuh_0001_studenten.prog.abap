*&---------------------------------------------------------------------*
*& Report ZUH_0001_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_0001_studenten.
**********************************************************************
*Tabelle anlegen
**********************************************************************
TYPES: BEGIN OF lty_s_studenten,
         name           TYPE string,
         Vorname        TYPE string,
         matrikelnr(10) TYPE n,
         studienfach    TYPE string,
         semester       TYPE i,
         abschluss      TYPE string,

       END OF lty_s_studenten,
       lty_t_studenten TYPE TABLE OF lty_s_studenten WITH KEY matrikelnr.
**********************************************************************
*Daten eintragen
**********************************************************************
DATA gs_studenten TYPE lty_s_studenten.
DATA gt_studenten TYPE lty_t_studenten.

gs_studenten-name = 'Mustermann'.
gs_studenten-vorname = 'Max'.
gs_studenten-matrikelnr = 1234567.
gs_studenten-studienfach = 'Architektur'.
gs_studenten-semester = 4.
gs_studenten-abschluss = 'B.A.'.

INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

gs_studenten-name = 'Hofmann'.
gs_studenten-vorname = 'Ulrich'.
gs_studenten-matrikelnr = 7654321.
gs_studenten-studienfach = 'Maschinenbau'.
gs_studenten-semester = 5.
gs_studenten-abschluss = 'K.A.'.

INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

gs_studenten-name = 'Meier'.
gs_studenten-vorname = 'Marius'.
gs_studenten-matrikelnr = 999.
gs_studenten-studienfach = 'Informatik'.
gs_studenten-semester = 2.
gs_studenten-abschluss = 'M.Sc'.

INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.
**********************************************************************
*Einen Studenten löschen (den 2ten)
**********************************************************************
DELETE gt_studenten INDEX 2.
**********************************************************************
*Ausgabe aller Studenten in der Liste
**********************************************************************
LOOP AT gt_studenten INTO gs_studenten.
  WRITE:  'Name: ', gs_studenten-name,
         / 'Vorname: ' , gs_studenten-vorname,
         / 'Martikelnr.:' , gs_studenten-matrikelnr,
         / 'Studienfach.:' , gs_studenten-Studienfach,
         / 'Semester: ' , gs_studenten-Semester,
         / 'Abschluss: ' , gs_studenten-Abschluss, /.
  CLEAR  gs_studenten.
ENDLOOP.
