*&---------------------------------------------------------------------*
*& Report ZTL_ZECIHENARTIGE_DT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTL_ZECIHENARTIGE_DT.


DATA: gv_char(10) TYPE c, "nr 10 deklariert wie lang zeichen sind also in dem fall 10zeichen also länge der variable
      gv_numc(10) TYPE n, "numerrierte char
      gv_string TYPE string. "hat dynamische länge da muss keine länge vorgegeben werden

gv_char = 'TestTestTest'. "letzte beide Zeichen werden abgeschnitten, da der char 10 Zeichen Lang ist
gv_numc = '12345'. "bei dem wird es auch abgeschnitten falls mehr zahlen als 10 sind. Falls es weniger sind füllt er automatisch 0 davor.

gv_string = 'Dies ist ein String'.

WRITE: gv_char, /, gv_numc, /, gv_string.

"Lektion (19)
"CONCATENATE --> bis zur 4 Zeichenartiger variablen in ein string zusammenführen

CONCATENATE gv_char gv_numc INTO gv_string SEPARATED BY ' '. "Leerzeichen zw. zusammengefügten variablen

WRITE / gv_string.

"Lektion(20) FIND and SEARCH

FIND 'Test' IN gv_string.

"sy-subrc ist return code feld das man abprüfen kann nachdem man das gesuchte gefunden hat
"wenn es nicht findet kommt keine ausgabe.
IF sy-subrc = 0.

  WRITE / 'Gefunden!'.

ENDIF.

FIND gv_numc IN gv_string.

IF sy-subrc = 0.

  WRITE / 'Gefunden!'.

ENDIF.

***************************************************************
*Ersetzen von Zeichen in Zeichenketten
***************************************************************
REPLACE ALL OCCURRENCES OF 'Test' IN gv_string WITH 'Hallo!'. "mit all occurences of ersetzt es test in jedem satz was in ganzn programm steht

IF sy-subrc = 0.

  WRITE / gv_string.

  ENDIF.

****************************************************************
* Zerlegen von Zeichenketten
****************************************************************
  DATA: gv_ganzer_name TYPE string VALUE 'Hans Meyer',
        gv_vorname TYPE string,
        gv_nachname TYPE string.

  SPLIT gv_ganzer_name AT ' ' INTO gv_vorname gv_nachname. "er splittet ab trennzeichen und in oberen fahl ist trennzeichen ein leerzeichen zw hans und meyer

  IF sy-subrc = 0.
    ULINE.
    WRITE: 'Vorname: ', gv_vorname, /, 'Nachname: ', gv_nachname.
  ENDIF.

*****************************************************************
*(23)Verdichten von zeichenketten und leerzeichen entfernen
*****************************************************************

 DATA: gv_verdichtung TYPE string VALUE ' das ist ein Verdichtungstest  '.

 ULINE.
 WRITE gv_verdichtung.

 CONDENSE gv_verdichtung NO-GAPS.

 WRITE gv_verdichtung.

*****************************************************************
*(24)Translate --> Umwandeln von Zeichenketten
*****************************************************************
 TRANSLATE gv_verdichtung TO UPPER CASE. "wandelt verdichtung komplett in gross buchstaben und TO LOWER CASE in klein dann
