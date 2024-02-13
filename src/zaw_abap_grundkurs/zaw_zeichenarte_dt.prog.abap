*&---------------------------------------------------------------------*
*& Report ZAW_ZEICHENARTE_DT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_zeichenarte_dt.

**********************************************************************
* Kommentar zur Strukturierung einfügen
* 3 Sternchen und TAB
**********************************************************************
DATA: gv_char(10) TYPE c, "Es erfolgt eine Konvertierung auf 10 Zeichen, alle weiteren Zeichen werden abgeschnitten.
      gv_numc(10) TYPE n, "Es erfolgt eine Konvertierung auf 10 Zeichen. Fehlende Stellen werden mit Null aufgefüllt.
      gv_string   TYPE string.

gv_char = 'Konvertierung'.
gv_numc = '12345'.
gv_string = 'Das ist ein String'.

WRITE: gv_char, /, gv_numc, /, gv_string.

CONCATENATE gv_char gv_numc INTO gv_string SEPARATED BY ' - '. "Kann auch durch ein Leerzeichen getrennt werden.

WRITE / gv_string.

FIND 'Konver' IN gv_string. "Es kann nach Zeichen oder Variable gesucht werden.

*SEARCH gv_string FOR 'Konver'. "Veraltet!

"-> Return-Code Feld
IF sy-subrc = 0.

  WRITE / 'Gefunden!'.

ENDIF.

REPLACE ALL OCCURRENCES OF 'Konver' IN gv_string WITH 'Ersatz'.

IF sy-subrc = 0.

  WRITE / gv_string.

ENDIF.

DATA: gv_ganzer_name TYPE string  VALUE 'Hans Meyer',
      gv_vorname     TYPE string,
      gv_nachname    TYPE string.

SPLIT gv_ganzer_name AT ' ' INTO gv_vorname gv_nachname. "AT gibt an, an welcher Stelle gesplittet werden soll.

IF sy-subrc = 0.

  ULINE.
  WRITE: 'Vorname: ', gv_vorname, /, 'Nachname: ', gv_nachname.

ENDIF.


DATA: gv_verdichtung TYPE string VALUE 'Das ist ein Test'.

ULINE.
WRITE gv_verdichtung.

TRANSLATE gv_verdichtung TO LOWER CASE. "-> in Kleinbuchstaben umwandeln

WRITE / gv_verdichtung.


**********************************************************************
* Verwendung von Textsymbolen
**********************************************************************
WRITE / TEXT-001. "Doppelklick auf Textsymbol um Inhalt zu sehen.

WRITE / TEXT-002.
