*&---------------------------------------------------------------------*
*& Report ZST_0000_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_0000_studenten.

TYPES: BEGIN OF lty_s_studenten,
         name           TYPE string,
         vorname        TYPE string,
         matrikelnr(10) TYPE n,
         studienfach    TYPE string,
         semster        TYPE i,
         abschluss      TYPE string,
       END OF lty_s_studenten,
       lty_t_studenten TYPE TABLE OF lty_s_studenten WITH KEY matrikelnr.

DATA: gs_studenten TYPE lty_s_studenten,
      gt_studenten TYPE lty_t_studenten.

gs_studenten-name = 'Mustermann'.
gs_studenten-vorname = 'Max'.
gs_studenten-matrikelnr = '1234567'.
gs_studenten-studienfach = 'Architektur'.
gs_studenten-semster = 4.
gs_studenten-abschluss = 'B.A.'.
INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

gs_studenten-name = 'Meier'.
gs_studenten-vorname = 'Marius'.
gs_studenten-matrikelnr = '999'.
gs_studenten-studienfach = 'Informatik'.
gs_studenten-semster = 2.
gs_studenten-abschluss = 'M.Sc.'.
INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

gs_studenten-name = 'Meyer'.
gs_studenten-vorname = 'Tom'.
gs_studenten-matrikelnr = '888'.
gs_studenten-studienfach = 'Informatik'.
gs_studenten-semster = 8.
gs_studenten-abschluss = 'Prof. Dr.'.
INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

Delete gt_studenten where matrikelnr = 888.

LOOP AT gt_studenten into gs_studenten.

WRITE: 'Name: ', gs_studenten-name,
/ 'Vorname: ', gs_studenten-vorname,
/'Matrikelnr: ', gs_studenten-matrikelnr,
/'Studienfach: ', gs_studenten-studienfach,
/'Semster: ', gs_studenten-semster,
/'Abschluss: ', gs_studenten-abschluss.
CLEAR gs_studenten.
ENDLOOP.
