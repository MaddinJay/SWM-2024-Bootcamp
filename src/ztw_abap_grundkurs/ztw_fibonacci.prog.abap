*&---------------------------------------------------------------------*
*& Report ZTW_FIBONACCI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_fibonacci.

TYPES: BEGIN OF lty_zeile,
         fibstelle TYPE i,
         fibwert   TYPE i,
       END OF lty_zeile.

DATA: gv_fibonacci_summand1 TYPE i.
DATA: gv_fibonacci_summand2 TYPE i.
DATA: gv_fibonacci_summe TYPE i.
DATA: gs_fibonacci TYPE lty_zeile.
DATA: gt_fibonacci TYPE TABLE OF lty_zeile.
DATA: gt_fibonacci_kopf TYPE TABLE OF lty_zeile WITH HEADER LINE.

gv_fibonacci_summand1 = 0.
gv_fibonacci_summand2 = 1.



DO 45 TIMES.

  gv_fibonacci_summe = gv_fibonacci_summand1 + gv_fibonacci_summand2.

  gs_fibonacci-fibstelle = sy-index.
  gs_fibonacci-fibwert = gv_fibonacci_summe.
  APPEND gs_fibonacci TO gt_fibonacci.

  gt_fibonacci_kopf-fibstelle = sy-index.
  gt_fibonacci_kopf-fibwert = gv_fibonacci_summe.
  APPEND gt_fibonacci_kopf.

  WRITE: gv_fibonacci_summe, '|'.

  gv_fibonacci_summand1 = gv_fibonacci_summand2. "Nach Berechnung ist Summe = Summand1 und wird mit Summand2 Addiert.
  gv_fibonacci_summand2 = gv_fibonacci_summe.

ENDDO.

*BREAK-POINT. "Setzt für den Debugger einen Break-Point. Debugger wird beim Ausführen autom. geöffnet
