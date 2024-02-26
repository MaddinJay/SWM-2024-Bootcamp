*&---------------------------------------------------------------------*
*& Report ZLC_ZEICHENARTIGE_DT_AS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_zeichenartige_dt_as.

**********************************************************************
*Datendeklarationen
**********************************************************************
DATA: gv_char(10) TYPE c, "Nur eine Länge von 10 Buchstaben (Achtung: Alles nach 10 Buchstaben wird nicht ausgegeben
      gv_numc(10) TYPE n, "Nur eine Länge von 10 Zahlen (Achtung: Ergebnis wird immer bis zu 10 Zahlen aufgefüllt
      gv_string   TYPE string. "Länge muss nicht angegeben werden

**********************************************************************
* Variablenbelegung
**********************************************************************
gv_char = 'TestTestTest'.
gv_numc = '12345'.
gv_string = 'Dies ist ein String'.

**********************************************************************
* Ausgab der Variablen
**********************************************************************
WRITE: gv_char,
/ gv_numc,
/ gv_string.

**********************************************************************
* Zusammenfügen von Zeichenketten
**********************************************************************
CONCATENATE gv_char gv_numc INTO gv_string SEPARATED BY ' X '.
WRITE / gv_string.

**********************************************************************
* Suchen in Zeichenketten
**********************************************************************
FIND 'Test' IN  gv_string.

IF sy-subrc = 0.

  WRITE / 'gefunden!'.

ENDIF.

*WRITE / gv_string.
**********************************************************************
* Ersetzen von Zeichen in Zeichenketten
**********************************************************************
REPLACE 'Test' IN gv_string WITH 'Hallo!'.

IF sy-subrc = 0.
  WRITE / gv_string.
ENDIF.

**********************************************************************
* Zerlegen von Zeichenketten
**********************************************************************

DATA: gv_ganzer_name TYPE string VALUE 'Ahmet Sevli',
      gv_vorname     TYPE string,
      gv_nachname    TYPE string.

SPLIT gv_ganzer_name AT ' ' INTO  gv_vorname gv_nachname.

IF sy-subrc = 0.

  ULINE.
  WRITE: 'Vorname: ', gv_vorname, /, 'Nachname: ', gv_nachname.

ENDIF.

**********************************************************************
* Verdichten von Zeichenketten
**********************************************************************
DATA: gv_verdichtung TYPE string VALUE ' das ist  ein Verdichtungstest  '.

ULINE.
WRITE gv_verdichtung.

CONDENSE gv_verdichtung NO-GAPS.
WRITE / gv_verdichtung.

**********************************************************************
* Umwandeln von Zeichenketten
**********************************************************************
ULINE.
WRITE gv_verdichtung.
TRANSLATE gv_verdichtung TO UPPER CASE. "TO LOWER CASE
WRITE: / 'ERGEBNIS: ', gv_verdichtung.

**********************************************************************
* Verwendung von Textsymbolen
**********************************************************************
ULINE.
WRITE text-001.
