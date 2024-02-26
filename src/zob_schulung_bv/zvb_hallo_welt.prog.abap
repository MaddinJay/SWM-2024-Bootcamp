*&---------------------------------------------------------------------*
*& Report ZVB_HALLO_WELT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zvb_hallo_welt LINE-SIZE 50. "Ausgabebreite der Liste beschränken

DATA: gv_name     TYPE string VALUE 'Benjamin',
      gv_nachname TYPE string,
      gv_strasse  TYPE string,
      gv_alter    TYPE i.

gv_nachname = 'Veletanlic'.

*gv_name = 'Benjamin'.

*WRITE 'Hallo Welt!'.

WRITE: gv_name, "Einfache Write Augabe
       / gv_nachname, "Zeilenumbruch
       'Test'.
SKIP 3. "Überspringt 3 Zeilen
ULINE. "Unterstreicht meine Zeile
