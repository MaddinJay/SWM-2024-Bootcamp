*&---------------------------------------------------------------------*
*& Report ZUH_ZEICHENARTIGE_DT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_zeichenartige_dt.
**********************************************************************
* Defininition der Variablen
**********************************************************************
DATA: gv_char(10) TYPE c,  "10 ist die länger des Charakter
      gv_numc(10) TYPE n,  "10 ist die länger der Zahl
      gv_string   TYPE string.
**********************************************************************
*Werte zu den Variablen
**********************************************************************

gv_char =  'TestTestTest'.
gv_numc = '12345'.
gv_string = 'Dies ist ein String'.
**********************************************************************
* Zusammenfassung und Ausgaben von Zeichenketten
**********************************************************************
WRITE: gv_char, /,
       gv_numc, /,
       gv_string.

CONCATENATE gv_char gv_numc INTO gv_string SEPARATED BY ''.  "zwei Texte werden zusammen gefügt und mit einem ' ' getrennt

WRITE: gv_char, /,
       gv_numc, /,
       gv_string.
**********************************************************************
* Finden von Werten
**********************************************************************
FIND 'Hallo' IN gv_string. "Findet nichts daher keine Ausgabe

IF sy-subrc = 0.

  WRITE / 'Gefunden!'.

ENDIF.


" ´SEARCH gv_string FOR '123'. --> Veraltet!! unterscheidet auch groß und klein schreibung

**********************************************************************
* Ersetzen von Zeichen in Zeichenketten
**********************************************************************

REPLACE ALL OCCURRENCES OF 'Test' IN gv_string WITH 'Hallo!'.  "Ohne ALL OCCURRENCES OF wird nur der erste Wert ersetzt

IF sy-subrc = 0.

  WRITE / gv_string.

ENDIF.

**********************************************************************
*Zerlegen von Zeichenketten
**********************************************************************

DATA: gv_ganzer_name TYPE string VALUE 'Hans Meyer',
      gv_vorname     TYPE String,
      gv_nachname    TYPE String.

SPLIT gv_ganzer_name AT ' ' INTO gv_vorname gv_nachname.

IF sy-subrc = 0.

  ULINE.
  WRITE: 'Vorname: ', gv_vorname, /, 'Nachname: ', gv_nachname.

ENDIF.

**********************************************************************
* Verdichten von Zeichenketten
**********************************************************************

DATA: gv_verdichtung TYPE string VALUE ' das ist   ein Verdichtungstest  '.

ULINE.
WRITE gv_verdichtung.

CONDENSE gv_verdichtung.
WRITE / gv_verdichtung.

CONDENSE gv_verdichtung NO-GAPS. " mit NO-GAPS werden alle Leerzeichen gelöscht ohne NO-Gabs werden nur überflüssige gelöscht
WRITE / gv_verdichtung.

**********************************************************************
* Umwandeln von Zeichenketten
**********************************************************************

TRANSLATE gv_verdichtung TO UPPER CASE. "alle in groß-Buchstaben
ULINE.
WRITE gv_verdichtung.

TRANSLATE gv_verdichtung TO LOWER CASE. "alles in klein Buchstaben
WRITE / gv_verdichtung.

**********************************************************************
*Verwendung von Textsysbole (Springen - Textelemente oder F5
**********************************************************************
**********************************************************************
*Textsymbole sind eingebettet im Program unter Textelemente
**********************************************************************
ULINE.
WRITE TEXT-001.
