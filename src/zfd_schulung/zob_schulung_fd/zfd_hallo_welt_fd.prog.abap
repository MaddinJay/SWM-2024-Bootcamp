*&---------------------------------------------------------------------*
*& Report ZFD_HALLO_WELT_FD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_hallo_welt_fd LINE-SIZE 50. " Ausgabebreite der Liste beschränken

DATA: gv_name TYPE string VALUE 'Klaus',
      gv_nachname TYPE ZFD_nachname,
      gv_strasse TYPE string.
Data lv_zahl type i.

" CONSTANTS

*lv_text = ' ich' && lv_text. *desadasd
*lv_text = ' ich' && lv_text.

lv_zahl = -3.

gv_nachname = 'Meyer'.

*gv_name = 'Klaus'.

*WRITE: 'Hallo Welt!'.

*WRITE gv_name. "Einfache Write Ausgabe
*WRITE / gv_nachname. "Zeilenumbruch
*WRITE / 'Test'.
*SKIP 3. "Überspringt 3 oder X Zeilen
*ULINE. " Unterstreicht eine Zeile
*
*WRITE: gv_name, *ich
*       / gv_nachname,
*       / 'Test'.
*
*write lv_text.
write lv_zahl.
