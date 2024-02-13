*&---------------------------------------------------------------------*
*& Report ZOD_HELLO_WELT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOD_HELLO_WELT LINE-SIZE 50.
DATA: gv_name TYPE string VALUE 'Orlando',
      gv_nachname TYPE string VALUE 'De la Torre',
      gv_ganzername TYPE string.

*WRITE 'Hallo Welt!'.
WRITE: 'Name: ', gv_name,"Einfache Write Ausgabe
       / 'Nachname: ' , gv_nachname. "Zeilenumbruch
SKIP 2."Zeilen überspringen
ULINE. "unterschtreicht eine Zeile
**********************************************************************
* Zeichen zusammenführen
**********************************************************************
CONCATENATE gv_name gv_nachname INTO gv_ganzername SEPARATED BY ' '.

WRITE: 'Vor und Nachname ', gv_ganzername.

ULINE.

**********************************************************************
* Zeichenkette umwandeln
**********************************************************************

TRANSLATE gv_ganzername TO UPPER CASE.
WRITE gv_ganzername.
ULINE.

**********************************************************************
* Zeichenkette umwandeln von E nach O
**********************************************************************
TRANSLATE gv_ganzername USING 'EO'.
WRITE gv_ganzername.
