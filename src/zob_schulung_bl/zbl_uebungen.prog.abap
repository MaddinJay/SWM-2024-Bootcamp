*&---------------------------------------------------------------------*
*& Report zbl_uebungen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_uebungen.

DATA decimal_number TYPE DECIMALS.
decimal_number = '15.55'.

DATA lv_variable TYPE i VALUE 4.
DATA lv_ergebnis TYPE i.
lv_ergebnis = decimal_number  +  lv_variable.

WRITE lv_ergebnis.

MULTIPLY decimal_number by lv_variable.
lv_ergebnis = decimal_number * lv_variable.
WRITE lv_ergebnis.

DATA text_string TYPE STRING.
text_string = '" In einem Loch im Boden, da lebte ein Hobbit."'.
REPLACE ALL OCCURRENCES OF 'e' in text_string with ''.
REPLACE ALL OCCURRENCES OF 'E' in text_string with ''.
WRITE text_string.


DATA lv_uhrzeit TYPE T.
GET TIME FIELD lv_uhrzeit.
WRITE: 'Aktuelle Uhrzeit=', lv_uhrzeit.
WRITE: sy-mandt.
WRITE: sy-dbsys.
