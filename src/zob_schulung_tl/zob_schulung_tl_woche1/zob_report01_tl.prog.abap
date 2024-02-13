*&---------------------------------------------------------------------*
*& Report zob_report01_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report01_tl.
*Mein erstes Programm in Excel :) Montag, den 20.11.23
WRITE 'Hello World'.
******************************************************************
"Systemdatum und Systemsprache ausgeben:
ULINE.
WRITE: 'Datum: ', sy-datum, /.
WRITE: 'Systemsprache: ', sy-langu.
******************************************************************
"Datenbankserver und Anwendungsserver:
ULINE.
WRITE: sy-dbsys, /, sy-host.
ULINE.
******************************************************************
"Zahl und Text Ausgabe Möglichkeit 1:
DATA(lv_text1) = ':)'.
WRITE lv_text1.

DATA(lv_zahl1) = 1234.
WRITE: /, 'Zahl: ', lv_zahl1.
******************************************************************
"Zahl und Text Ausgabe Möglichkeit 2:
DATA: lv_text TYPE string VALUE 'Ich bin ein Text',
      lv_zahl TYPE i VALUE 3.
WRITE: /, lv_text, lv_zahl.
ULINE.
******************************************************************
"IF ELSE mit Datenmanipulation
"Kommt als Ergebnis 'WAHR' raus
IF ( 'Das ist noch ein Satz' CA 'abc').
WRITE: 'WAHR', /.
ELSE.
WRITE: 'FALSCH', /.
ENDIF.
"Kommt als Ergebnis 'FALSCH' raus
IF ( 'Das ist noch ein Satz' CA 'bx').
WRITE 'WAHR'.
ELSE.
WRITE 'FALSCH'.
ENDIF.
ULINE.
******************************************************************
"lv_text und Hello World zusammenführen + zahlen addieren:
lv_text = 'Hello World' && lv_text.
lv_zahl = lv_zahl + 10.
WRITE: lv_text, lv_zahl.
ULINE.

"Führende Nullen entfernen:
DATA(lv_zahl2) = '000123'.
SHIFT lv_zahl2 LEFT DELETING LEADING '0'.
WRITE lv_zahl2.
ULINE.
******************************************************************
"IF ELSE mit Datenmanipulation CS (Contains)
"Kommt als Ergebnis 'WAHR' raus
IF ( 'ABCDEFG' CS 'BD').
WRITE: 'WAHR', /.
ELSE.
WRITE: 'FALSCH', /.
ENDIF.

******************************************************************
