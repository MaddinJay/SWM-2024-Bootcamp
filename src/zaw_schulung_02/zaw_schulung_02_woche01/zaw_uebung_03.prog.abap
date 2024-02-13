*&---------------------------------------------------------------------*
*& Report zaw_uebung_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_03.

*Deklarieren Sie zwei Zahlen a und b und geben Sie ihnen beliebige Werte. c ist die Summe aus a und b.
*Lassen Sie sich den folgenden Text ausgeben: 'Die Summe aus a und b ist c.'
*Ersetzen Sie dabei a, b und c mit den Zahlenwerten.

DATA: lv_zahl_a TYPE i VALUE 5,
      lv_zahl_b TYPE i VALUE 3,
      lv_zahl_c TYPE i.

lv_zahl_c = lv_zahl_a + lv_zahl_b.

WRITE: 'Die Summe aus',lv_zahl_a,'und',lv_zahl_b,'ist',lv_zahl_c,'.'.
WRITE: / |Die Summe aus { lv_zahl_a } und { lv_zahl_b } ist { lv_zahl_c }.|.


*Deklarieren Sie einen Typ. Dieser enthält zwei Spalten für Sprachkürzel und Text.
*Verwenden Sie den Typ um eine Tabelle zu deklarieren. Befüllen Sie die Tabelle.

TYPES: BEGIN OF ls_sprache,
         sprachkuerzel(2) TYPE c,
         text             TYPE string,
       END OF ls_sprache.

DATA: lt_sprache TYPE TABLE OF ls_sprache.

lt_sprache = VALUE #(
( sprachkuerzel = 'DE' text = 'Deutsch' )
(  sprachkuerzel = 'EN' text = 'Englisch' )
(  sprachkuerzel = 'FR' text = 'Französisch' )
(  sprachkuerzel = 'RU' text = 'Russisch' )
).

cl_demo_output=>display( lt_sprache ).
