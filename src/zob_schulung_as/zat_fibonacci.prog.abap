*&---------------------------------------------------------------------*
*& Report ZAT_FIBONACCI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zat_fibonacci.

**********************************************************************
* Struktur
**********************************************************************
TYPES: BEGIN OF lty_zeile,
         fibstelle TYPE i,
         fibwert   TYPE i,
       END OF lty_zeile.

**********************************************************************
* Variablen
**********************************************************************
DATA: gv_fibonacci_summand1 TYPE i.
DATA: gv_fibonacci_summand2 TYPE i.
DATA: gv_fibonacci_summe TYPE i.
DATA: gs_fibonacci TYPE lty_zeile. "Globale Strktur mit unserem Strukturtype lty_zeile
DATA: gt_fibonacci TYPE TABLE of lty_zeile. "Globale Tabelle mit unserem Strukturtypen lty_zeile
DATA: gt_fibonacci_kopf TYPE TABLE OF lty_zeile WITH HEADER LINE. "Globale Tabellenkopf mit unserem Strukturtyp lty_zeile und Kopfzeile

**********************************************************************
* Variablen Wertzuweisung
**********************************************************************
gv_fibonacci_summand1 = 0.
gv_fibonacci_summand2 = 1.

**********************************************************************
* Do-Befehl
**********************************************************************
DO 10 TIMES.


  gv_fibonacci_summe = gv_fibonacci_summand1 + gv_fibonacci_summand2.

  gs_fibonacci-fibstelle = sy-index. "Fibstelle = Anzahl der Versuche der Do-Schleife
  gs_fibonacci-fibwert = gv_fibonacci_summe. "Fibwert = Fibonacci Summe
  APPEND gs_fibonacci TO gt_fibonacci. "Zeilen der globalen Struktur gs_fibonacci werden der globalen Tabelle gt_fibonacci hinzugefügt

  gt_fibonacci_kopf-fibstelle = sy-index.
  gt_fibonacci_kopf-fibwert = gv_fibonacci_summe.
  APPEND gt_fibonacci_kopf.

  WRITE: gv_fibonacci_summe, '|'.

  gv_fibonacci_summand1 = gv_fibonacci_summand2.
  gv_fibonacci_summand2 = gv_fibonacci_summe.

ENDDO.
