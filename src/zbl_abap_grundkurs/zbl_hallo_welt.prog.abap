*&---------------------------------------------------------------------*
*& Report ZBL_HALLO_WELT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_hallo_welt LINE-SIZE 50. "Ausgabebreite der Liste beschränken"

DATA: gv_name     TYPE string VALUE 'Klaus',
      gv_nachname TYPE ZBL_Nachname,
      gv_strasse  TYPE string,
      gv_alter    TYPE i.


gv_nachname = 'Mayer'.

*gv_name = 'Klaus'.

*Write: 'Hallo Welt'.

WRITE: gv_name, "Einfache Write Ausgabe"
     / gv_nachname, "Zeilenumbruch"
     'Test'.
SKIP 3. "Überspringt 3 Zeilen"
ULINE. "Underlining"
