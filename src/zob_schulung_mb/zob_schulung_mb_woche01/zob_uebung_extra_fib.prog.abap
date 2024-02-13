*&---------------------------------------------------------------------*
*& Report zob_uebung_extra_fib
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_extra_fib.

*erstellen SIe eine Zahl lv_zahl.
*geben sie die fibonacci sequenz bis zu der lv_zahl Zahl aus.


DATA: lv_zahl TYPE i VALUE 100.
DATA: lv_fibonacci TYPE i,
      lv_previous TYPE i VALUE 0,
      lv_current TYPE i VALUE 1,
      lv_temp TYPE i.

WRITE: / 'Fibonacci Sequenz Ausgabe', lv_zahl, ' ist:'.

DO lv_zahl TIMES.
  WRITE / lv_previous.

  lv_temp = lv_current.
  lv_current = lv_previous + lv_current.
  lv_previous = lv_temp.

  IF lv_previous > lv_zahl.
    EXIT.
  ENDIF.
ENDDO.
