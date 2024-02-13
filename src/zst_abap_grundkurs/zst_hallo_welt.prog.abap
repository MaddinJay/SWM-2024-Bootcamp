*&---------------------------------------------------------------------*
*& Report ZST_HALLO_WELT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_hallo_welt LINE-SIZE 50. "Ausgabebreite der Liste begrenzen (50 Zeichen in diesem Fall)

DATA: gv_name     TYPE string VALUE 'Klaus',
      gv_nachname TYPE ZST_Nachname,
      gv_strasse  TYPE string,
      gv_alter    TYPE i.

gv_nachname = 'Meyer'.
GV_Strasse = 'Teststraße'.
gv_alter = '36'.

*Write: 'Hallo Welt!'.

WRITE: gv_name, "Einfache Write Ausgabe
/ gv_nachname,
/ gv_strasse,
/ gv_alter. "Zeilenumbruch
SKIP 3. "Leerzeile + Anzahl der Zeilen
ULINE. "Durchgezogener Strich / unterstreichen
