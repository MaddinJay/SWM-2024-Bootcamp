*&---------------------------------------------------------------------*
*& Report ZHELLOWORLD_HUM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhelloworld_hum LINE-SIZE 50. "Ausgabe Linie wird auf 50 Zeichen begrenzt, im ganzen Report

DATA gv_name TYPE string VALUE 'Klaus'. "ohne Kettensatz
DATA gv_nachname TYPE Z_GK_Nachname_HUM.


gv_nachname = 'Mueller'.

*gv_name = 'Sabina'.

WRITE: 'Hello World!', "mit Kettensatz
        / gv_name,
        / gv_nachname. "Zeilenumbruch
SKIP 3. "Zeile wird übersprungen bzw. 3 Zeilen in diesem Fall
ULINE. "Unterstreicht eine Zeile ohne Begrenzung; Begrenzung s.o. oder in der Zeile ULINE 50
