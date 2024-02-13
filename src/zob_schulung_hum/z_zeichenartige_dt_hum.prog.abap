*&---------------------------------------------------------------------*
*& Report Z_ZEICHENARTIGE_DT_HUM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_zeichenartige_dt_hum.
**********************************************************************
* Datendeklarationen
**********************************************************************

DATA: gv_char(10) TYPE c, "C= 1 Zeichen (10) länge der Variablen, reserviert sich 10
      gv_numc(10) TYPE n, "Numchar ausschließlich zahlenartige
      gv_string   TYPE string. "Datentyp variabler Länge, reserviert sich so viele wie er benötigt

**********************************************************************
* Variablenbelegung
**********************************************************************

gv_char = 'TestTestTest'. "Wird abgeschnitten auf 10 STellen
gv_numc = '12345'. "Wird aufgefüllt mit Nullen
gv_string = 'Dies ist ein String'.

**********************************************************************
* Ausgabe der Variablen
**********************************************************************

WRITE: gv_char, / gv_numc, / gv_string.

**********************************************************************
* Zusammenfügen von Zeichenketten
**********************************************************************

CONCATENATE gv_char gv_numc INTO gv_string SEPARATED BY 'X'. "bis zu 4 Variablen, ohne Kommatrennung; SEPARATED BY fügt ein Wunschzeichen ein

WRITE / gv_string. "Der String wurde durch CONCATENATE überschrieben

**********************************************************************
* Suchen in Zeichenketten
**********************************************************************

FIND 'Test' IN gv_string. "wird gefunden, daher erfolgt eine Ausgabe

IF sy-subrc = 0. "0 bedeutet gefunden, s.a. F1 zu FIND,
  WRITE / 'gefunden!'.
ENDIF.

*SEARCH gv-string FOR '123'. " Veraltet!!

**********************************************************************
* Ersetzen von Zeichen in Zeichenketten
**********************************************************************
REPLACE 'Test' IN gv_string WITH 'Hallo!'. "Standardmäßig wird nur das ersetzt
"REPLACE ALL OCCURRENCES OF ersetzt alle

IF sy-subrc = 0.
  WRITE / gv_string.
ENDIF.

**********************************************************************
* Zerlegen von Zeichenketten
**********************************************************************
DATA: gv_ganzer_name TYPE string VALUE 'Hans Mayer',
      gv_vorname     TYPE string,
      gv_nachname    TYPE string.

SPLIT gv_ganzer_name AT ' ' INTO gv_vorname gv_nachname.

IF sy-subrc = 0.
  ULINE.
  WRITE: 'Vorname: ',gv_vorname, / 'Nachname: ', gv_nachname.
ENDIF.

**********************************************************************
* Verdichten von Zeichenketten
**********************************************************************
DATA: gv_verdichtung TYPE string VALUE ' das ist ein Verdichtungstest   .'.
ULINE.
WRITE gv_verdichtung.

CONDENSE gv_verdichtung. "Löscht unnötige Leerzeichen
WRITE / gv_verdichtung.

CONDENSE gv_verdichtung NO-GAPS. "Löscht alle Leerzeichen
WRITE / gv_verdichtung.

**********************************************************************
* Umwandeln von Zeichenketten
**********************************************************************
TRANSLATE gv_verdichtung TO UPPER CASE.
ULINE.
WRITE gv_verdichtung.

TRANSLATE gv_verdichtung TO LOWER CASE.
WRITE / gv_verdichtung.

**********************************************************************
* Textsymbole - vorgefertigte Bausteine
**********************************************************************
"Springen --> Textelemente; Textelement anlegen, sichern und aktivieren
ULINE.
WRITE TEXT-001. "Doppelklick auf 001 und man kann einsehen wie der Text genau heißt
