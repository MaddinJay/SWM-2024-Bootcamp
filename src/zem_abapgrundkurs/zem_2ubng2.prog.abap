*&---------------------------------------------------------------------*
*& Report ZEM_2UBNG2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_2ubng2.

TYPES: BEGIN OF lsy_stdate,
         Vorname        TYPE string,
         Nachname       TYPE string,
         MatrikelNr(10) TYPE n,
         Studienfach    TYPE string,
         Semester       TYPE i,
         Abschluss(4)   TYPE c,
       END OF lsy_stdate.


TYPES lty_stdate TYPE TABLE OF lsy_stdate.

DATA gs_stdate TYPE lsy_stdate.
DATA gt_stdate TYPE SORTED TABLE OF lsy_stdate WITH UNIQUE KEY MatrikelNr.

gs_stdate-Vorname = '1'.
gs_stdate-Nachname = 'Kuhmuh'.
gs_stdate-MatrikelNr = 1234567.
gs_stdate-Studienfach = 'Architektur'.
gs_stdate-Semester = 4.
gs_stdate-Abschluss = 'B.A.'.
INSERT gs_stdate INTO TABLE gt_stdate.

gs_stdate-Vorname = 'Sabine'.
gs_stdate-Nachname = 'Moll'.
gs_stdate-MatrikelNr = 99.
gs_stdate-Studienfach = 'Sport'.
gs_stdate-Semester = 5.
gs_stdate-Abschluss = 'B.A.'.
INSERT gs_stdate INTO TABLE gt_stdate.
CLEAR gs_stdate.


gs_stdate-Vorname = 'Lee'.
gs_stdate-Nachname = 'Nygen'.
gs_stdate-MatrikelNr = 47556.
gs_stdate-Studienfach = 'Archäologie'.
gs_stdate-Semester = 4.
gs_stdate-Abschluss = 'B.A.'.
INSERT gs_stdate INTO TABLE gt_stdate.
Clear gs_stdate.


gs_stdate-Vorname = 'Mascha'.
gs_stdate-Nachname = 'Perokovska'.
gs_stdate-MatrikelNr = 876.
gs_stdate-Studienfach = 'Informatik'.
gs_stdate-Semester = 3.
gs_stdate-Abschluss = 'B.A.'.
INSERT gs_stdate INTO TABLE gt_stdate.
Clear gs_stdate.

gs_stdate-Vorname = 'Peter'.
gs_stdate-Nachname = 'Polster'.
gs_stdate-MatrikelNr = 55559.
gs_stdate-Studienfach = 'Informatik'.
gs_stdate-Semester = 1.
gs_stdate-Abschluss = 'B.A.'.
INSERT gs_stdate INTO TABLE gt_stdate.
Clear gs_stdate.

gs_stdate-Vorname = 'Paula'.
gs_stdate-Nachname = 'Po'.
gs_stdate-MatrikelNr = 34666.
gs_stdate-Studienfach = 'Architektur'.
gs_stdate-Semester = 1.
gs_stdate-Abschluss = 'B.A.'.
INSERT gs_stdate INTO TABLE gt_stdate.
CLEAR gs_stdate.

DELETE gt_stdate WHERE Studienfach = 'Sport'.


LOOP AT gt_stdate INTO gs_stdate.

  WRITE: /'MatrikelNr.:  ', gs_stdate-MatrikelNr,
/'Vorname:  ', gs_stdate-vorname,
/'Nachname:  ', gs_stdate-Nachname,
/'Studienfach:  ', gs_stdate-Studienfach,
/'Semester:  ', gs_stdate-Semester,
/'Abschluss:  ', gs_stdate-Abschluss.

Skip 1.
Uline.

Clear gs_stdate.

ENDLOOP.
