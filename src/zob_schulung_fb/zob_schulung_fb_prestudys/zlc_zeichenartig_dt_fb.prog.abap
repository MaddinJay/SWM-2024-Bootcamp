*&---------------------------------------------------------------------*
*& Report ZLC_ZEICHENARTIG_DT_FB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_zeichenartig_dt_fb.

DATA: gv_char(10) TYPE c,
      gv_numc(10) TYPE n,
      gv_string   TYPE string.

gv_char ='TestTestTest'.
gv_numc = '12345'.

gv_string = 'Dies ist ein String'.

WRITE: gv_char, /, gv_numc, /, gv_string.

CONCATENATE gv_char gv_numc INTO gv_string SEPARATED BY ' '.

WRITE / gv_string.

*FIND 'Test' IN gv_string.
FIND gv_numc IN gv_string.

IF sy-subrc = 0.

  WRITE / 'Gefunden!'.

ENDIF.

********************************
* Zerlegen von Zeichenketten
********************************

DATA: gv_ganzer_name  TYPE string VALUE 'Hans Meyer',
      gv_vorname      TYPE string,
      gv_nachname      TYPE string.

SPLIT gv_ganzer_name AT ' ' INTO gv_vorname gv_nachname.

IF sy-subrc = 0.

  ULINE.
  WRITE: 'Vorname: ', gv_vorname, /, 'Nachname: ', gv_nachname.

ENDIF.

********************************
* Verdichten von Zeichenketten
********************************
DATA: gv_verdichtung TYPE string VALUE ' das ist ein Verdichtungstext '.

ULINE.
WRITE gv_verdichtung.

CONDENSE gv_verdichtung NO-GAPS.

WRITE / gv_verdichtung.

********************************
* Umwandeln von Zeichenketten
********************************
TRANSLATE gv_verdichtung TO UPPER CASE.   "TO LOWER CASE (Kleinscrheibung)
ULINE.
WRITE gv_verdichtung.

********************************
* Verwendung von Textsymbolen
********************************
ULINE.
WRITE / text-001.
