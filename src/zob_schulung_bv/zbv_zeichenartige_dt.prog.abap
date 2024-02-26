*&---------------------------------------------------------------------*
*& Report ZBV_ZEICHENARTIGE_DT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_zeichenartige_dt.

**********************************************************************
*Datendeklarationen
**********************************************************************
DATA: gv_char(10) TYPE c,
      gv_numc(10) TYPE n,
      gv_string   TYPE string.

**********************************************************************
*Variablenbelegung
**********************************************************************
gv_char = 'TestTestTest'.
gv_numc = '12345'.
gv_string = 'Dies ist ein string'.

**********************************************************************
*Ausgabe er Variablen
**********************************************************************
WRITE: gv_char, /, gv_numc, /, gv_string.

**********************************************************************
*Zusammenfügen von Zeichenketten
**********************************************************************
CONCATENATE gv_char gv_numc INTO gv_string SEPARATED BY ' '.

WRITE / gv_string.

**********************************************************************
*Suchen in Zeichenketten
**********************************************************************
FIND 'HALLO' IN gv_string. "Findet nichts, daher keine Ausgabe

IF sy-subrc = 0.

  WRITE / 'Gefunden!'.

ENDIF.

*SEARCH gv_string FOR '123'. --> Veraltet!!

**********************************************************************
*Ersetzen von Zeichen in Zeichenketten
**********************************************************************
REPLACE ALL OCCURRENCES OF 'Test' IN gv_string WITH 'Hallo!'.

IF sy-subrc = 0.

  WRITE / gv_string.

ENDIF.

**********************************************************************
*Zerlegen von Zeichenketten
**********************************************************************
DATA: gv_ganzer_name TYPE string VALUE 'Benjamin Veletanlic',
      gv_vorname     TYPE string,
      gv_nachname    TYPE string.

SPLIT  gv_ganzer_name AT ' ' INTO gv_vorname gv_nachname.

IF sy-subrc = 0.

  ULINE.
  WRITE: 'Vorname: ', gv_vorname, /, 'Nachname: ', gv_nachname.

ENDIF.

**********************************************************************
*Verdichten von Zeichenketten
**********************************************************************
DATA gv_verdichtung TYPE string VALUE ' das ist  ein Verdichtungstest  '.

ULINE.
WRITE gv_verdichtung.

CONDENSE gv_verdichtung NO-GAPS. "Alle Leerzeichen werden entfernt

*CONDENSE gv_verdichtung. "Überflüssige Leerzeilen werden entfernt

WRITE / gv_verdichtung.
**********************************************************************
*Umwandeln von Zeichenketten
**********************************************************************
TRANSLATE gv_verdichtung TO UPPER CASE. "Verwandelt Text in Grossbuchstaben, bei Kleinbuchstaben kann man TO LOWER CASE verwenden
ULINE.
WRITE gv_verdichtung.

**********************************************************************
*Verwendung von Textsymbolen
**********************************************************************
ULINE.
WRITE text-001.
