*&---------------------------------------------------------------------*
*& Report ZLC_KOMPLEXE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_komplexe_datentypen.

**********************************************************************
* Lokaler Strukturtyp
**********************************************************************
TYPES: BEGIN OF lty_s_mitarbeiter, "ltys_s_ = lokaler strukturtyp
         pernr   TYPE i,
         vorname TYPE string,
         name    TYPE string,
         alter   TYPE i,
       END OF lty_s_mitarbeiter.

TYPES lty_t_mitarbeiter TYPE TABLE OF lty_s_mitarbeiter. "lokaler tabellentyp

DATA gs_mitarbeiter TYPE lty_s_mitarbeiter.
DATA gt_mitarbeiter TYPE lty_t_mitarbeiter.
DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY pernr. "UNIQUE KEY gibt es nur bei sorted tables

**********************************************************************
* Einfügen von Datensätzen
**********************************************************************
gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Ahmet'.
gs_mitarbeiter-name = 'Sevli'.
gs_mitarbeiter-alter = 28.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2. "INSERT fügt den Datensatz an der passenden Stelle ein
CLEAR gs_mitarbeiter.

gs_mitarbeiter-pernr = 1.
gs_mitarbeiter-vorname = 'Paul'.
gs_mitarbeiter-name = 'Martin'.
gs_mitarbeiter-alter = 38.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
CLEAR gs_mitarbeiter.
CLEAR gt_mitarbeiter.
APPEND LINES OF gt_mitarbeiter2 TO gt_mitarbeiter. "Alle Zeilen der gt_mitarbeiter2 Tabelle werden der gt_mitarbeiter Tabelle hinzugefügt

gs_mitarbeiter-pernr = 3.
gs_mitarbeiter-vorname = 'Mario'.
gs_mitarbeiter-name = 'Forest'.
gs_mitarbeiter-alter = 40.

INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.

*INSERT LINES OF gt_mitarbeiter2 FROM 1 to 1 INTO TABLE gt_mitarbeiter. "Fügt die Zeile 1 der gt_mitarbeiter2 Tabelle der gt_mitarbeiter Tabelle hinzu
INSERT LINES OF gt_mitarbeiter2 FROM 1 TO 2 INTO TABLE gt_mitarbeiter. "Fügt die Zeilen 1-2 der gt_mitarbeiter2 Tabelle der gt_mitarbeiter Tabelle hinzu



**********************************************************************
* Auslesen von Datensätzen
**********************************************************************
READ TABLE gt_mitarbeiter2 INDEX 2 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH TABLE KEY pernr = 1 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH KEY name = 'Sevli' INTO gs_mitarbeiter.

CLEAR gs_mitarbeiter. "Löscht den Inhalt der Struktur gs_mitarbeiter
LOOP AT gt_mitarbeiter INTO gs_mitarbeiter. "Erstellt einen Loop an der Stelle wo die Inhalte der Tabelle gt_mitarbeiter
  "sequentiell der Struktur gs_mitarbeiter hinzugefügt werden
  WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter, /. "liest gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter aus

  CLEAR gs_mitarbeiter. "Löscht den Inhalt der Struktur gs_mitarbeiter
ENDLOOP. "Loop ist beendet und startet wieder neu


**********************************************************************
* Verändern von Datensätzen
**********************************************************************
SORT gt_mitarbeiter BY name ASCENDING. "Sortiert die Tabelle gt_mitarbeiter nach der Variable name aufsteigend A-Z


gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Thomas'.
gs_mitarbeiter-name = 'Müller'.
gs_mitarbeiter-alter = 34.



MODIFY TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. "Wenn Primärschlüssel vorhanden
MODIFY gt_mitarbeiter2 FROM gs_mitarbeiter INDEX 2. "Wenn kein Primärschlüssel vorhanden / Wenn er nicht verwendet werden soll

**********************************************************************
* Löschen von Datensätzen
**********************************************************************
DELETE TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. "Sucht Zeile auf Basis PK und löscht
IF sy-subrc <> 0. "0 steht für Erfolg!
WRITE: 'Löschen hat nicht geklappt!'.
ENDIF.
DELETE gt_mitarbeiter2 INDEX 2. "Löscht den Inhalt der Zeile 2 (falls es einen gibt)
