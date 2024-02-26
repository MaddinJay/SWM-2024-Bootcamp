*&---------------------------------------------------------------------*
*& Report ZTL_HALLO_WELT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTL_HALLO_WELT LINE-SIZE 50. "Ausgabebreite der Liste beschränkt

DATA: gv_name TYPE string VALUE 'Tea',
 gv_nachname TYPE ZTL_GK_NACHNAME,
 gv_strasse TYPE string,
gv_alter TYPE i.



gv_nachname = 'Meier'.

*gv_name = 'Tea'.
*WRITE: 'Hallo Welt'.

WRITE gv_name. "Einfache Write Ausgabe
WRITE / gv_nachname. "Zeilenumbruch
WRITE 'Test'.
SKIP 3. "Überspringt 3 Zeilen
ULINE. "Unterstreich eine Zeile
