*&---------------------------------------------------------------------*
*& Report ZLV_ZEICHENARTIGE_DT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLV_ZEICHENARTIGE_DT.
**********************************************************************
* Datendeklarationen
**********************************************************************
DATA: gv_char(10) TYPE c.
DATA: gv_numc(10) TYPE n.
DATA: gv_string TYPE string. "string braucht keine länge

**********************************************************************
* Variablen belegung
**********************************************************************

gv_char = 'TtTestTest'. "das hat 12 zeichen. also werden die letzten zwei abgeschnitten.
gv_numc = '123415'.
gv_string = 'ditmemai thang cho de'.

**********************************************************************
*Ausgabe der Variablen
**********************************************************************

WRITE: / gv_char.
WRITE: / gv_numc.
WRITE: / gv_string.

WRITE: / gv_char, / gv_numc, / gv_string.

**********************************************************************
*Zusammenfügen von Zeichenketten
**********************************************************************

CONCATENATE gv_char gv_numc INTO gv_string SEPARATED BY ' '.
WRITE: / .
WRITE: / .
WRITE: / gv_string.

**********************************************************************
*Suchen in Zeichenketten
**********************************************************************

WRITE: / .
WRITE: / .

FIND gv_numc IN gv_string.

IF sy-subrc = 0.
  WRITE: / 'gefunden'.

ENDIF. "ELSEIF sy-subrc = 4.
*  WRITE: 'nix gefunden'.

SEARCH gv_string FOR '234'.

**********************************************************************
*Ersetzen von Zeichen in Zeichenketten
**********************************************************************


*based on C Kernel, write, concatenate
* test durch hallo ersetzen
REPLACE ALL OCCURRENCES OF 'Test' IN gv_string WITH 'Hallo'. "abap befehl. der return, zurückliefert"

IF sy-subrc = 0.

  WRITE: / gv_string.

ENDIF.

**********************************************************************
* Zerlegen von zeichenketten (wie concatenate)
**********************************************************************

DATA: gv_ganzer_name TYPE string VALUE 'Hans Mayer',
      gv_vorname     TYPE string,
      gv_nachname    TYPE string.

SPLIT gv_ganzer_name AT ' ' INTO gv_vorname gv_nachname.

IF sy-subrc = 0.
  ULINE.
WRITE: / 'vorname: ', gv_vorname,
      / 'nachname: ', gv_nachname.
ENDIF.

**********************************************************************
*verdichten von zeichenketten (leerzeichen zu entfernen)
**********************************************************************

DATA: gv_verdichtung TYPE string VALUE '  das ist eine   verdichtungsTest  '.
ULINE.
WRITE: gv_verdichtung.

*CONDENSE gv_verdichtung NO-GAPS.
CONDENSE gv_verdichtung.
WRITE: / gv_verdichtung.

**********************************************************************
*umwandeln von zeichenketten (z.b. groß und kleinbuchstaben umwandeln)
**********************************************************************

TRANSLATE gv_verdichtung TO UPPER CASE. " to lower case
ULINE.
WRITE / gv_verdichtung.

**********************************************************************
* textsymbole und verwendung
**********************************************************************

WRITE / text-001.
