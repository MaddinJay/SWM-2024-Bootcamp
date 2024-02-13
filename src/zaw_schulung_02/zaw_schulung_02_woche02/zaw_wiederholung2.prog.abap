*&---------------------------------------------------------------------*
*& Report zaw_wiederholung2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_wiederholung2.


SELECT SINGLE                 "Es wird nur ein Ergebnis zurückgegeben (z.B. eine Summe), dass in eine Struktur geschrieben wird.
FROM scarr                    "Es kommt immer der erste Treffer aus der Datenbank.
FIELDS *
INTO @DATA(ls_struktur).


SELECT                         "Es wird eine Ergebnismenge zurückgegeben, die in eine Tabelle geschrieben werden muss, da mehrere Zeilen und Spalten.
FROM scarr
FIELDS *
INTO TABLE @DATA(lt_tabelle).


SELECT sflight~mandt, sflight~carrid, sflight~connid,       "Immer besser nur die Felder in die interne Tabelle schreiben, die benötigt werden, da performanter!
SUM( sflight~price ) AS price_sum
FROM sflight
GROUP BY mandt, carrid, connid
INTO TABLE @DATA(lt_summe).

" -> Damit im Arbeitsbereich einzelne Daten (Zeilen) geändert werden können, soll mit einem LOOP gearbeitet werden.



"Eingabefeld

PARAMETERS p_test TYPE string.


"Checkbox

PARAMETERS p_check AS CHECKBOX.


"Optionsgruppe

PARAMETERS: p_radio1 RADIOBUTTON GROUP g_t DEFAULT 'X',
            p_radio2 RADIOBUTTON GROUP g_t,
            p_radio3 RADIOBUTTON GROUP g_t.


" Rahmen mit Überschrift

SELECTION-SCREEN BEGIN OF BLOCK g_t WITH FRAME TITLE TEXT-003.
  PARAMETERS p_test2 TYPE string.
SELECTION-SCREEN END OF BLOCK g_t.


" Komplexe Eingabe -> Eingabehilfe für Datenbanktabelle

TABLES scarr.
SELECT-OPTIONS s_opt1 FOR scarr-carrid.


AT SELECTION-SCREEN ON RADIOBUTTON GROUP g_t.
  WRITE 'Test'.

START-OF-SELECTION.
  WRITE 'ok'.
