*&---------------------------------------------------------------------*
*& Report z_as_fibonacci
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_fibonacci.

DATA: lv_sum1 TYPE i,
      lv_sum2 TYPE i,
      lv_erg  TYPE i.

lv_sum1 = 0.
lv_sum2 = 1.

DO 20 TIMES.



  lv_erg = lv_sum1 + lv_sum2.
    WRITE lv_erg.
  lv_sum1 = lv_sum2.
  lv_sum2 = lv_erg.



ENDDO.
