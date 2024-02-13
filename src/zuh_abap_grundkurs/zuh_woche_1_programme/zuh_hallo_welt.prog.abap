*&---------------------------------------------------------------------*
*& Report ZUH_HALLO_WELT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_hallo_welt LINE-SIZE 50. "Beschränkung der Ausgabenbreite

DATA: gv_name     TYPE string VALUE 'Klaus',
      gv_nachname TYPE ZUH_GK_NACHNAME,
      gv_strasse  TYPE String,
      gv_alter    TYPE i.

gv_nachname = 'Meyer'.

*gv_name = 'Klaus'.

WRITE: 'Hallo Welt!'.

WRITE: gv_name, "Einfache Write Ausgabe
       / gv_nachname, "Zeilenumbruch
       'Test'.

SKIP 3. "Zeilen überspringen in der Ausgabe
ULINE. "Untersreichen einer Zeile
