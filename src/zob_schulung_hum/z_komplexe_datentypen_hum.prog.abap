*&---------------------------------------------------------------------*
*& Report Z_KOMPLEXE_DATENTYPEN_HUM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_komplexe_datentypen_hum.

**********************************************************************
* Definition der Strukturtypen
**********************************************************************
TYPES: BEGIN OF lty_s_mitarbeiter, "lty lokaler Type s struktur lty_s_ lokaler Strukturtyp
         personalnr TYPE i,
         Vorname    TYPE string,
         Nachname   TYPE string,
         Alter      TYPE i,
       END OF lty_s_mitarbeiter.

**********************************************************************
*Definition Tabellentyp
**********************************************************************
TYPES lty_t_mitarbeiter TYPE TABLE OF  lty_s_mitarbeiter. "lty_t lokaler Tabellentyp

**********************************************************************
*Datendeklaration, Variablenbestimmung
**********************************************************************
DATA gs_mitarbeiter TYPE lty_s_mitarbeiter. "Type ist der lokale Strukturtyp
DATA gt_mitarbeiter TYPE lty_t_mitarbeiter. "Type ist der lokale Tabellentyp  "Alternative Deklaration Tabellentyp; s.a. untenstehende Deklaration
DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY personalnr. "für UNIQUE KEY muss zwingende TYPE SORTED TABLE OF sein

gs_mitarbeiter-personalnr = 1.
gs_mitarbeiter-vorname = 'Hans'. "nach gs_mitarbeiter- STRG+Leertaste, dann werden einem die Vorschläge Vorname, Nachname und Alter gebracht
gs_mitarbeiter-nachname = 'Müller'.
gs_mitarbeiter-alter = 50.

*APPEND gs_mitarbeiter TO gt_mitarbeiter2. "hängt den EIntrag an die Tabelle an
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.  "Insert fügt den Datensatz in die Tabelle ein, bei Sortierung an der richtigen Stelle in der Tabelle
*INSERT gs_mitarbeiter INTO gt_mitarbeiter2 INDEX 1. "weitere Möglichkeit für das hinzufügen, nicht unbedingt für sortierte Tabellen, sondern wenn ein Datensatz an eine bestimmte Stelle soll
CLEAR gs_mitarbeiter. "es müssen keine weiteren Strukturtypen definiert werden, CLEAR sorgt dafür, dass vorherige Eingaben in gs_mitarbeiter zurückgesetzt werden

gs_mitarbeiter-personalnr = 3.
gs_mitarbeiter-vorname = 'Peter'.
gs_mitarbeiter-nachname = 'Anders'.
gs_mitarbeiter-alter = 23.

*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
CLEAR gs_mitarbeiter.

gs_mitarbeiter-personalnr = 2.
gs_mitarbeiter-vorname = 'Michelle'.
gs_mitarbeiter-nachname = 'Grüner'.
gs_mitarbeiter-alter = 45.

*APPEND gs_mitarbeiter TO gt_mitarbeiter2. "Aufgrund des APPEND-Befehl kommt es hier zu einem Laufzeitfehler, da die 2 nach der 3 kommt und wir einen Schlüssel haben
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
CLEAR gs_mitarbeiter.

gs_mitarbeiter-personalnr = 5.
gs_mitarbeiter-vorname = 'Gertrude'.
gs_mitarbeiter-nachname = 'Hunt'.
gs_mitarbeiter-alter = 19.

*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
CLEAR gs_mitarbeiter.

**********************************************************************
*Mehrere Zeilen einfügen APPEND LINES und INSERT LINES
**********************************************************************

APPEND LINES OF gt_mitarbeiter2 TO gt_mitarbeiter. "Alle Zeilen der gt_mitarbeiter werden in gt_mitarbeiter gefüllt
*INSERT LINES OF gt_mitarbeiter2 INTO TABLE gt_mitarbeiter2. " Bei INSERT LINES wird INTO TABLE benötigt
INSERT LINES OF gt_mitarbeiter2 FROM 1 TO 2 INTO TABLE gt_mitarbeiter. "Nur die erste ZEile würde eingefügt werden, man kann eine Range an ZEilen einfügen bspw. FROM 3 TO 8

**********************************************************************
* Auslesen der Datensätzen
**********************************************************************
READ TABLE gt_mitarbeiter2 INDEX 2 INTO gs_mitarbeiter. "Möglichkeit 1
READ TABLE gt_mitarbeiter2 WITH TABLE KEY personalnr = 1 INTO gs_mitarbeiter. "Möglichkeit 2
READ TABLE gt_mitarbeiter2 WITH KEY nachname = 'Anders' INTO gs_mitarbeiter. "Möglichkeit 3

**********************************************************************
* LOOP Befehl
**********************************************************************

CLEAR gs_mitarbeiter. "Vor und nach dem LOOP einen CLEAR setzen
LOOP AT gt_mitarbeiter INTO gs_mitarbeiter. "WHERE personalnr = 1 AND nachname = 'Müller' kann noch einschränken über was geloopt wird.
  WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-nachname, gs_mitarbeiter-alter, /.
  CLEAR gs_mitarbeiter.
ENDLOOP.


**********************************************************************
*Verändern von Datensätzen
**********************************************************************
SORT gt_mitarbeiter BY nachname ASCENDING. "Funktioniert nicht bei SORTED oder HASH Tabellen

SORT gt_mitarbeiter BY nachname DESCENDING.

gs_mitarbeiter-personalnr = 3.
gs_mitarbeiter-vorname = 'Peter'.
gs_mitarbeiter-nachname = 'Glück'.
gs_mitarbeiter-alter = 23.

MODIFY TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. "Wenn Primärschlüssel vorhanden!
*MODIFY gt_mitarbeiter2 FROM gs_mitarbeiter INDEX 2. "Wenn kein Primärschlüssel vorhanden / Wenn er nicht verwendet werden soll !

WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-nachname, gs_mitarbeiter-alter.

**********************************************************************
*DELETE-Befehl - Löschen von Datensätzen
**********************************************************************
DELETE TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. "Sucht Zeile auf Basis PK und löscht
IF sy-subrc <> 0. "0 ist die Erfolgsmeldung
  WRITE: 'Löschen hat nicht geklappt!'.
ENDIF.

DELETE gt_mitarbeiter2 INDEX 2.

**********************************************************************
* Move Corresponding
**********************************************************************
"zum Kopieren namendgleicher Strukturkomponenten; durchläuft die Struktur, prüft auf Namensgleichheit, durchläuft die Strukturen sequenziell
"kann dazu führen dass das Programm sehr langsam wird, dient mehr der Bequemlichkeit
" prüft nicht auf Typkompatibilität
" Move-Corresponding XXX TO XXX


**********************************************************************
*
**********************************************************************
