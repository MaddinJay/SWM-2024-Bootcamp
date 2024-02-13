*&---------------------------------------------------------------------*
*& Report ZMB_HALLO_WELT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_hallo_welt LINE-SIZE 50.

DATA: gv_name     TYPE string VALUE 'Klaus',
      gv_nachname TYPE string,
      gv_strasse  TYPE string,
      gv_alter    TYPE string.


gv_nachname = 'Meyer'.

*gv_name = 'Klaus'.

*WRITE: 'Hallo Welt!'.

WRITE: gv_name, "Einfache Write Ausgabe
     / gv_nachname, " Zeilenumbruch
      'Test'.
SKIP 3. "Überspringt 3 Zeilen
ULINE. "Unterstreicht eine Zeil
