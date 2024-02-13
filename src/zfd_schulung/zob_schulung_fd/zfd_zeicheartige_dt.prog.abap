*&---------------------------------------------------------------------*
*& Report ZFD_ZEICHEARTIGE_DT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_zeicheartige_dt.

**********************************************************************
*Datendeklarationen
**********************************************************************

DATA: gv_char(10) TYPE c,
      gv_numc(10) TYPE n, "Numchar nur zahlenaritige Zeichen
      gv_string   TYPE string.

**********************************************************************
*Variablenbelegung
**********************************************************************
gv_char = 'TestTestTest'.
WRITE gv_char.

gv_numc = '123456'. " Leere Stellen im Numchar werden mit "0" belegt !!
WRITE gv_numc.
gv_numc = '1234567890123456777'.
WRITE gv_numc.

gv_string = 'Das ist ein String!'.

**********************************************************************
*Ausgabe der Variablen
**********************************************************************
WRITE: /, gv_char,/,gv_numc,/,gv_string.

**********************************************************************
*Zusammenfügen von Zeichenketten
**********************************************************************
CONCATENATE gv_char gv_numc INTO gv_string SEPARATED BY '@'. " bis zu 4 zeicheartige Variablen verketten into Varible

WRITE / gv_string.



**********************************************************************
*Suchen in Zeichenketten
**********************************************************************
ULINE.
ULINE.
gv_string = 'Servus!'.
FIND gv_numc IN gv_string.

IF sy-subrc = 0.
  WRITE 'gefunden'.
ENDIF.

IF sy-subrc = 4.
  WRITE 'nix gefunden!'.
ENDIF.

ULINE.
ULINE.

" Search gv_string FOR '123'.  ->>> Veraltet!

**********************************************************************
*Ersetzen von Zeichenketten
**********************************************************************
REPLACE ALL OCCURRENCES OF 'Test' IN gv_string WITH 'Hallo!'.

IF sy-subrc = 0.
  WRITE / gv_string.
ENDIF.

**********************************************************************
*Zerlegen von Zeichenketten
**********************************************************************
DATA: gv_ganzer_name TYPE string VALUE 'Hans Dampf',
      gv_vorname     TYPE string,
      gv_nachname    TYPE string.

SPLIT gv_ganzer_name AT ' ' INTO gv_vorname gv_nachname.

IF sy-subrc = 0.
  WRITE: /, 'Vorname:', gv_vorname.
  WRITE: /, 'Nachname:', gv_nachname.
ENDIF.

**********************************************************************
*Verdichten von Zeichenketten
**********************************************************************

DATA: gv_verdichtung TYPE string VALUE ' das ist  ein Verdichtungstest   '.

ULINE.
WRITE gv_verdichtung.

CONDENSE gv_verdichtung.
WRITE / gv_verdichtung.

CONDENSE gv_verdichtung NO-GAPS.
WRITE / gv_verdichtung.

**********************************************************************
*Umwandeln von Zeichenketten
**********************************************************************
TRANSLATE gv_verdichtung TO LOWER CASE. " oder in TO UPPER CASE
ULINE.
WRITE / gv_verdichtung.

**********************************************************************
*Verwendung von Textsymbolen  (besser als Konstanten zu verwenden!)
**********************************************************************
ULINE.
DATA gv_testtext TYPE string.
WRITE TEXT-001.
" translate text-001 to UPPER CASE.
" CONDENSE text-001 NO-GAPS.
WRITE TEXT-001.
