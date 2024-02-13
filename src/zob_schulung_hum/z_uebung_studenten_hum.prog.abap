*&---------------------------------------------------------------------*
*& Report Z_UEBUNG_STUDENTEN_HUM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_studenten_hum.

**********************************************************************
*Definition Strukturtyp
**********************************************************************
TYPES: BEGIN OF lty_s_studenten,
         Name        TYPE string,
         Vorname     TYPE string,
         Matrikelnr(10)  TYPE n, "auch i möglich
         Studienfach TYPE string,
         Semester(2) TYPE n,
         Abschluss   TYPE string,
       END OF lty_s_studenten.

**********************************************************************
*Definition Tabellentyp
**********************************************************************
TYPES lty_t_studenten TYPE TABLE OF lty_s_studenten WITH KEY Matrikelnr. " hier hatte with Key gefehlt. s.u.

**********************************************************************
*Datendeklaration
**********************************************************************
DATA gs_studenten TYPE lty_s_studenten.
DATA gt_studenten TYPE  lty_t_studenten. "SORTED TABLE OF...WITH UNIQUE KEY Matrikelnr. anscheinend so nicht. s.o. Und es muss lty_t_studenten sein

gs_studenten-name: = 'Mustermann'.
gs_studenten-vorname: = 'Maximilian'.
gs_studenten-matrikelnr: = 1234567. "wenn n oder i, dann ohne ' '.
gs_studenten-studienfach: = 'Architektur'.
gs_studenten-semester: = 4.
gs_studenten-abschluss: = 'B.A.'.
INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

gs_studenten-name: = 'Heinzelmann'.
gs_studenten-vorname: = 'Tassilo'.
gs_studenten-matrikelnr: = 125.
gs_studenten-studienfach: = 'Kunst und Design'.
gs_studenten-semester: = 5.
gs_studenten-abschluss: = 'M. of Arts'.
INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

gs_studenten-name: = 'Glühwürmchen'.
gs_studenten-vorname: = 'Heidemarie'.
gs_studenten-matrikelnr: = 5236.
gs_studenten-studienfach: = 'Informatik'.
gs_studenten-semester: = 7.
gs_studenten-abschluss: = 'B.Sc.'.
INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.


**********************************************************************
*Ausgabe
**********************************************************************

DELETE gt_studenten WHERE Matrikelnr = 125. " Where nicht Index in diesem Fall verwenden

IF sy-subrc <> 0.
  WRITE: /'Löschen hat nicht geklappt!'.
ENDIF.

CLEAR gs_studenten.

LOOP AT gt_studenten INTO gs_studenten.
  WRITE: / 'Name:', gs_studenten-name,
  / 'Vorname:', gs_studenten-vorname,
  / 'Matrikelnr:', gs_studenten-matrikelnr,
  / 'Studienfach:', gs_studenten-studienfach,
  / 'Semester:', gs_studenten-semester,
  / 'Abschluss:', gs_studenten-abschluss.
  CLEAR gs_studenten.
ENDLOOP.
