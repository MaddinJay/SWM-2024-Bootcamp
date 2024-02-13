*&---------------------------------------------------------------------*
*& Report zbl_uebungtabelle
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_uebungtabelle.

TYPES: BEGIN OF ty_waehrung,
         euro TYPE p DECIMALS 2,
         dollar TYPE p DECIMALS 2,
       END OF ty_waehrung.

DATA: lt_waehrung TYPE TABLE OF ty_waehrung, "Tabelle
      wa_waehrung TYPE ty_waehrung. "Arbeitsbereich

DO 100 TIMES.
  wa_waehrung-euro = sy-index.
  wa_waehrung-dollar = sy-index * '1.09'. "1 Euro entspricht 1.09 Dollar
  APPEND wa_waehrung TO lt_waehrung.
ENDDO.

"Zur Ausgabe der Daten
LOOP AT lt_waehrung INTO wa_waehrung.
  WRITE: / 'Euro:', wa_waehrung-euro, 'Dollar:', wa_waehrung-dollar.
ENDLOOP.



"Deklarieren Sie eine Tabelle mit zwei Spalten (Euro und Dollar).
"Befüllen Sie die erste Spalte der Tabelle mit den Zahlen 1 -100.
"Ermitteln Sie für jeden Euro Wert (jede Zeile der Tabelle) den äquivalenten Dollar Wert und schreiben Sie ihn in die Tabelle.
