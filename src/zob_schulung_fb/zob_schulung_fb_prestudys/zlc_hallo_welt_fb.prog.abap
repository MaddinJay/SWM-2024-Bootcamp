*&---------------------------------------------------------------------*
*& Report ZLC_HALLO_WELT_FB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_hallo_welt_fb LINE-SIZE 50.    "Ausgabelänge der Liste beschränken

DATA: gv_name     TYPE string VALUE 'Fabian',
      gv_nachname TYPE ZLC_FB_NACHNAME,
      gv_strasse  TYPE string,
      gv_alter    TYPE i.

gv_nachname = 'Bednarzik'.

"gv_name = 'Fabian'.

"WRITE:'Hallo Welt von FB!'.

WRITE: gv_name,            "einfach WRITE Ausgabe
       / gv_nachname,      "Zeilenumbruch
       / 'bester Mann'.
SKIP   1.                 "überspringt 1(x) Zeilen
ULINE.                    "unterstreicht eine Zeile
