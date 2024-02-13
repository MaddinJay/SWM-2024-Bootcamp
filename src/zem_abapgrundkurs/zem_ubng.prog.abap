*&---------------------------------------------------------------------*
*& Report ZEM_UBNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_ubng.

TYPES: BEGIN OF lsy_stdate,
         Vorname        TYPE string,
         Nachname       TYPE string,
         MatrikelNr(10) TYPE n,
         Studienfach    TYPE string,
         Semester       TYPE i,
         Abschluss(4)   TYPE c,
       END OF lsy_stdate.


DATA gs_stdate TYPE lsy_stdate.

gs_stdate-Vorname = 'Max'.
gs_stdate-Nachname = 'Mustermann'.
gs_stdate-MatrikelNr = 1234567.
gs_stdate-Studienfach = 'Architektur'.
gs_stdate-Semester = 4.
gs_stdate-Abschluss = 'B.A.'.

WRITE: 'Vorname:  ', gs_stdate-vorname,
/'Nachname:  ', gs_stdate-Nachname,
/'MatrikelNr.:  ', gs_stdate-MatrikelNr,
/'Studienfach:  ', gs_stdate-Studienfach,
/'Semester:  ', gs_stdate-Semester,
/'Abschluss:  ', gs_stdate-Abschluss.
