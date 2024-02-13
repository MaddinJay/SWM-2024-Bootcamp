*&---------------------------------------------------------------------*
*& Report ZST_ZEICHENARTIGE_DT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_zeichenartige_dt.
*******************************************************************************************************************************
*Datendeklaration
*******************************************************************************************************************************
DATA: gv_char(10) TYPE c,
      gv_numc(10) TYPE n,
      gv_string   TYPE string.
*******************************************************************************************************************************
*Variablenbelegung
*******************************************************************************************************************************
gv_char = 'TestTestTest'.
gv_numc = '123456'.

gv_string = 'Dies ist ein String'.
*******************************************************************************************************************************
*Ausgabe der Variablen
*******************************************************************************************************************************
WRITE: gv_char, / , gv_numc,/, gv_string.
*******************************************************************************************************************************
*Zusammenführung von Zeichenketten
*******************************************************************************************************************************
CONCATENATE gv_char gv_numc INTO gv_string SEPARATED BY ' '.

WRITE / gv_string.
*******************************************************************************************************************************
*Suchen in Zeichenketten
*******************************************************************************************************************************
FIND 'Hallo' IN gv_string. "Suche .... in ...

IF sy-subrc = 0. "Wenn das Ergebnis (sy-subrc -> siehe F1 Hilfe) positiv ist

  WRITE / 'Gefunden!'.

ENDIF.

*******************************************************************************************************************************
*Ersetzen in Zeichenketten
*******************************************************************************************************************************
REPLACE ALL OCCURRENCES OF 'Test' IN gv_string WITH 'Hallo!'. "ersetzt alle Begriffe

IF sy-subrc = 0.

  WRITE / gv_string.

ENDIF.

*******************************************************************************************************************************
*Zerlegen von Zeichenketten
*******************************************************************************************************************************

DATA: gv_ganzer_name TYPE string VALUE 'Hans Meyer',
      gv_vorname     TYPE string,
      gv_nachname    TYPE string.

SPLIT gv_ganzer_name AT ' ' INTO gv_vorname gv_nachname. "Das Feld "ganzer Name" wird AM (AT) LEEERZEICHEN getrennt, davor geht zu "Vorname" / danach geht an "Nachname"

if sy-subrc = 0.

ULINE.
WRITE: 'Vorname: ', gv_vorname, /, 'Nachname: ', gv_nachname.

ENDIF.

*******************************************************************************************************************************
*Verdichten von Zeichenketten (entfernt Leerzeichen)
*******************************************************************************************************************************

DATA: gv_verdichtung TYPE string value '  das ist ein   Verdichtungstest'. "unnötige Leerzeichen werden im Text entfernt

ULINE.
write gv_verdichtung.

CONDENSE gv_verdichtung NO-Gaps. "Alle Leerzeichen werden gelöscht

WRITE / gv_verdichtung.

*******************************************************************************************************************************
*Umwandeln von Zeichenketten
*******************************************************************************************************************************
TRANSLATE gv_verdichtung TO UPPER CASE. "Alles Groß / TO LOWER CASE - Kleinschreibung

ULINE.
WRITE gv_verdichtung.
*******************************************************************************************************************************
*Textsymbole
*******************************************************************************************************************************

ULINE.
Write / text-001.