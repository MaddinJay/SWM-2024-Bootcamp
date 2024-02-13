*&---------------------------------------------------------------------*
*& Report ZEM_HALLO_WELT2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_hallo_welt2
LINE-SIZE 50. "Begrenzung Breite

DATA: gv_wschimpf TYPE string VALUE 'Schnauze', "Kettensatz
      gv_schimpf TYPE string VALUE 'halt die',
      gv_azschimpf TYPE string.

gv_azschimpf = '!'. "zu Zeile 13

WRITE: gv_schimpf, "einfache ausgabe 1 - ueber zeile 9
      gv_wschimpf, " einfache ausgabe 2 - ueber zeile 8
      gv_azschimpf, "einfache ausgabe - ueber zeile 10/12
      / '...', "zeilenumbruch vor Ausgabe
      'alter'.
SKIP 3. "zeilenumbruch // mit Zeilenanzahl
ULINE."unterstrichen
