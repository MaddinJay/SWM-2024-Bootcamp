*&---------------------------------------------------------------------*
*& Report ZZ_0002_LOESUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zz_0002_loesung.

**********************************************************************
* Strukturtypen lty_s_studenten erstellen
**********************************************************************
TYPES: BEGIN OF lty_s_studenten,
         name        TYPE string,
         vorname     TYPE string,
         matrnr(10)  TYPE n,
         studienfach TYPE string,
         semester    TYPE n,
         abschluss   TYPE string,
       END OF lty_s_studenten,
       lty_t_studenten TYPE SORTED TABLE OF lty_s_studenten WITH UNIQUE KEY matrnr. "Tabellentyp lty_t_studenten erstellen

**********************************************************************
* Struktur gs_studenten erstellen auf Basis Strukturtyp lty_s_studenten
**********************************************************************
DATA gs_studenten TYPE lty_s_studenten.
DATA gt_studenten TYPE lty_t_studenten. "Interne Tabelle gt_studenten anlegen

**********************************************************************
* Datensätze mit Inhalt befüllen
**********************************************************************
gs_studenten-name = 'Mustermann'.
gs_studenten-vorname = 'Max'.
gs_studenten-matrnr = 0001234567.
gs_studenten-studienfach = 'Architektur'.
gs_studenten-semester = 4.
gs_studenten-abschluss = 'B.A.'.
INSERT gs_studenten INTO TABLE gt_studenten. "Inhalte der gs_studenten Variablen der Tabelle gt_studenten hinzufügen
CLEAR gs_studenten.

gs_studenten-name = 'Meier'.
gs_studenten-vorname = 'Marius'.
gs_studenten-matrnr = 0000000999.
gs_studenten-studienfach = 'Informatik'.
gs_studenten-semester = 2.
gs_studenten-abschluss = 'M.Sc.'.
INSERT gs_studenten INTO TABLE gt_studenten. "Inhalte der gs_studenten Variablen der Tabelle gt_studenten hinzufügen
CLEAR gs_studenten.

gs_studenten-name = 'Sevli'.
gs_studenten-vorname = 'Ahmet'.
gs_studenten-matrnr = 0000002499.
gs_studenten-studienfach = 'Wirtschaftsinformatik'.
gs_studenten-semester = 3.
gs_studenten-abschluss = 'M.Sc.'.
INSERT gs_studenten INTO TABLE gt_studenten. "Inhalte der gs_studenten Variablen der Tabelle gt_studenten hinzufügen
CLEAR gs_studenten.

**********************************************************************
* Datensatz löschen
**********************************************************************
DELETE gt_studenten WHERE matrnr = 0000000999. "Inhalt in der Tabelle gt_studenten löschen, wo die Matrikelnummer 0000000999 ist

**********************************************************************
* Loop erstellen
**********************************************************************
LOOP AT gt_studenten INTO gs_studenten.
WRITE: 'Name: ', gs_studenten-name,
 / 'Vorname', gs_studenten-vorname,
 / 'Matrikelnr.: ', gs_studenten-matrnr,
 / 'Studienfach: ', gs_studenten-studienfach,
 / 'Semester: ', gs_studenten-semester,
 / 'Abschluss: ', gs_studenten-abschluss.
 CLEAR gs_studenten.
ENDLOOP.
