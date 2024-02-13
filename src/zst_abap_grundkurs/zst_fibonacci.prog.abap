*&---------------------------------------------------------------------*
*& Report ZST_FIBONACCI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_fibonacci.

DATA: gv_fibonacci_summand1 TYPE i.
DATA: gv_fibonacci_summand2 TYPE i.
DATA: gv_fibonacci_summe TYPE i.

gv_fibonacci_summand1 = 0.
gv_fibonacci_summand2 = 1.

DO 45 TIMES.

  gv_fibonacci_summe = gv_fibonacci_summand1 + gv_fibonacci_summand2.

  WRITE: gv_fibonacci_summe, '|'.

  gv_fibonacci_summand1 = gv_fibonacci_summand2.
  gv_fibonacci_summand2 = gv_fibonacci_summe.

ENDDO.
