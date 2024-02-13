*&---------------------------------------------------------------------*
*& Report ZAW_TEST_STUDENTEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_test_studenten.

**********************************************************************
* 1. Strukturtyp anlegen
**********************************************************************
TYPES: BEGIN OF lty_s_studi,
         Name          TYPE string,
         Vorname       TYPE string,
         Matrikelnr(7) TYPE n,
         Studienfach   TYPE string,
         Semester      TYPE i,
         Abschluss     TYPE string,
       END OF lty_s_studi.
**********************************************************************
* 2. Tabellentyp anlegen (basierend auf welchem Strukturtyp und ggf. Schlüssel)
**********************************************************************
TYPES lty_t_studi TYPE TABLE OF lty_s_studi with key  Matrikelnr.
**********************************************************************
* 3. Struktur erzeugen und interne Tabelle anlegen
**********************************************************************
DATA: gs_studi TYPE lty_s_studi,
      gt_studi TYPE lty_t_studi.
**********************************************************************
* 4. Datenwerte befüllen für 1. Datensatz
**********************************************************************
gs_studi-Name = 'Mustermann'.
gs_studi-Vorname = 'Max'.
gs_studi-Matrikelnr = '1'.
gs_studi-Studienfach = 'Architektur'.
gs_studi-Semester = '4'.
gs_studi-Abschluss = 'B.A.'.
**********************************************************************
* 5. Einfügen eines weiteren Datensatzen (INSERT wegen Schlüssel)
**********************************************************************
INSERT gs_studi INTO TABLE gt_studi.
**********************************************************************
* 6. Zurücksetzen auf den Initialzustand, damit keine alten Werte mehr vorhanden sind.
**********************************************************************
CLEAR gs_studi.
gs_studi-Name = 'Musterfrau'.
gs_studi-Vorname = 'Maxima'.
gs_studi-Matrikelnr = '2'.
gs_studi-Studienfach = 'Psychologie'.
gs_studi-Semester = '6'.
gs_studi-Abschluss = 'M.Sc.'.
INSERT gs_studi INTO TABLE gt_studi.
CLEAR gs_studi.

gs_studi-Name = 'Musterkind'.
gs_studi-Vorname = 'Marius'.
gs_studi-Matrikelnr = '3'.
gs_studi-Studienfach = 'Philosophie'.
gs_studi-Semester = '10'.
gs_studi-Abschluss = 'M.Sc.'.
INSERT gs_studi INTO TABLE gt_studi.
CLEAR gs_studi.
**********************************************************************
* 7. Datensatz aus Tabelle löschen anhand des Schlüssels
**********************************************************************
DELETE gt_studi WHERE Matrikelnr = 2.
**********************************************************************
* 8. Ausgabe der restlichen Daten durch SChleife
**********************************************************************
LOOP AT gt_studi INTO gs_studi.
WRITE: 'Name: ' , gs_studi-Name,
/ 'Vorname: ' , gs_studi-Vorname,
/ 'Matrikelnr.: ' , gs_studi-Matrikelnr,
/ 'Studienfach: ' , gs_studi-Studienfach,
/ 'Semester: ' , gs_studi-Semester,
/ 'Abschluss: ' , gs_studi-Abschluss.
ENDLOOP.
