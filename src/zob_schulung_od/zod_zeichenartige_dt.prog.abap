*&---------------------------------------------------------------------*
*& Report ZOD_ZEICHENARTIGE_DT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOD_ZEICHENARTIGE_DT.
**********************************************************************
* Datendeklaration
**********************************************************************
DATA: gv_char(10) TYPE c,
      gv_numc(10) TYPE n,
      gv_string TYPE string.
**********************************************************************
* Variablenbelegung
**********************************************************************
gv_char = 'TestTestTest'.
gv_numc ='12345'.
gv_string ='dies ist ein String'.
**********************************************************************
* Ausgabe der Variablen
**********************************************************************
WRITE: gv_char, / gv_numc, / gv_string.
**********************************************************************
* Zusammenfügen von Zeichenketten
**********************************************************************
CONCATENATE gv_char gv_numc INTO gv_string SEPARATED BY ' '.
WRITE  / gv_string.

**********************************************************************
*Suchen in zusammengeführten Zeichenkette
**********************************************************************

FIND 'Servus' IN gv_string.

IF sy-subrc = 0.

  WRITE / 'nicht gefunden!'.

  ENDIF.

*  SEARCH gv_string FOR '123'. ---> veraltet!

**********************************************************************
* Ersetzen von Zeichen in Zeichenketten
**********************************************************************

REPLACE ALL OCCURRENCES OF 'Test' IN gv_string WITH 'Hallo'.

IF sy-subrc = 0.

WRITE / gv_string.

ENDIF.
**********************************************************************
*Zerlegen von Zeichenketten
**********************************************************************

DATA: gv_ganzer_name TYPE string VALUE 'Hans Meyer',
      gv_vorname TYPE string,
      gv_nachname TYPE string.
SPLIT gv_ganzer_name AT ' ' INTO gv_vorname gv_nachname.

IF sy-subrc = 0.

ULINE.
WRITE: 'Vorname: ', gv_vorname, /, 'Nachname: ', gv_nachname.
SKIP 2 .
ENDIF.

**********************************************************************
* Verdichten von Zeichenketten
**********************************************************************
DATA gv_verdichtung TYPE string VALUE ' das ist ein Verdichtungstest  '.

ULINE.
WRITE gv_verdichtung.

*CONDENSE gv_verdichtung NO-GAPS. "Alle Leerzeichen löschen
CONDENSE gv_verdichtung.

WRITE / gv_verdichtung.

**********************************************************************
* Umwandeln von Zeichenketten (Klein/Gross)
**********************************************************************

TRANSLATE gv_verdichtung TO UPPER CASE. "TO LOWER CASE

ULINE.
WRITE gv_verdichtung.

**********************************************************************
* Verwendung von Testsymbolen
**********************************************************************
ULINE.
WRITE text-001.
