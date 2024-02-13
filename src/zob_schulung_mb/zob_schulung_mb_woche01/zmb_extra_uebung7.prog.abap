*&---------------------------------------------------------------------*
*& Report zmb_extra_uebung7
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_extra_uebung7.

DATA: lv_zahl TYPE i VALUE 10, " Setze hier die gewünschte Zahl ein
      lv_fibonacci TYPE i,
      lv_fibonacci_prev TYPE i VALUE 0,
      lv_fibonacci_curr TYPE i VALUE 1,
      lv_counter TYPE i VALUE 0.

WRITE: / 'Fibonacci-Sequenz bis zur Zahl ',/, lv_zahl, ':'.

DO lv_zahl TIMES.
  lv_counter = lv_counter + 1.
  WRITE lv_fibonacci_curr.

  lv_fibonacci = lv_fibonacci_prev + lv_fibonacci_curr.
  lv_fibonacci_prev = lv_fibonacci_curr.
  lv_fibonacci_curr = lv_fibonacci.
ENDDO.
