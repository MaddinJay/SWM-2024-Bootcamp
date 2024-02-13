*&---------------------------------------------------------------------*
*& Report zwiederholung_woche1_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zwiederholung_woche1_tl.

"Datendeklaration:
"Elementarer Typ deklarieren
DATA lv_zahl TYPE i VALUE 3.

"Variable  ausgeben
WRITE lv_zahl.
cl_demo_output=>display( lv_zahl ).

"Datenmanipulation
lv_zahl = lv_zahl + 8.

"Systemwerte
WRITE sy-uname.

"Konstanten
CONSTANTS c_wert TYPE string VALUE 'Test'.

"Typdeklaration
TYPES: ty_wert(6) TYPE c, "Variante 1
       ty_wert2   TYPE c LENGTH 6. "Variante 2 --> Kommt das gleiche wie oben
*****************"Wenn ich DATA schreibe dann erstelle ich eine Variable, wenn ich TYPES schreibe dann muss ich eine
*****************"Variable deklarieren um weiter machen zu können.
"Struktur deklarieren
DATA: BEGIN OF ls_kunde,
        id    TYPE i,
        name  TYPE string,
        alter TYPE i,
      END OF ls_kunde.

"Struktur befüllen
ls_kunde-id = 5.
ls_kunde-name = 'Test'.
cl_demo_output=>display( ls_kunde ).
ls_kunde = VALUE #( id = 7 ).
ls_kunde = VALUE #( BASE ls_kunde name = 'Testi' ). "An dieser Stelle wird gesagt, das oben genannten Name und id mit 7 und Testi geändert werden!
cl_demo_output=>display( ls_kunde ).
ls_kunde-alter = 12.
ls_kunde = VALUE #( id = 20 ).
*cl_demo_output=>display ( ls_kunde ).

"Tabelle deklarieren
DATA: lt_tabelle LIKE TABLE OF ls_kunde.

"Tabelle befüllen
APPEND ls_kunde TO lt_tabelle.          "Möglichkeit1
APPEND VALUE #( id = 5 ) TO lt_tabelle. "-->befüllen Möglichkeit1

INSERT ls_kunde INTO lt_tabelle INDEX 1. "Möglichkeit2
lt_tabelle = VALUE #(                    "-->befüllen Möglichkeit 2.1
( id = 8 )                               "Wenn man BASE nicht dazu schreibt, dann wird die Zeile davor überschrieben und es wird nur das angezeigt was am Ende kommt.
( id = 12 )
( id = 10 )
).
lt_tabelle = VALUE #( BASE lt_tabelle     "-->befüllen Möglichkeit 2.2( id = 8 )
( id = 12 name = 'Name 1' alter = 14 ) "-->Eine Klammer ist eine Zeile in der Tabelle, da kann man alles schreiben
( id = 10 )
).

"Schleifen:
******************************
"LOOP (Über eine Tabelle Loop)

"WHILE (solange dieser Zustand nicht erreicht/ erreicht ist mach es weiter)

"DO x Times.

"Verzweigungen:
******************************
"IF/ ELSE IF/ ELSE --> Bedingungen: AND/ OR/
IF ls_kunde-alter = 10 AND ls_kunde-name = 'Test'.
WRITE 'Super'.
ELSE.
WRITE 'Nicht super'.
ENDIF.

"CASE
