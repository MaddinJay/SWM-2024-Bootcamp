*&---------------------------------------------------------------------*
*& Report zem_pruefen_mini
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_pruefen_mini.

Data lv_1(8) type n value '001'.

Data lv_2 type n LENGTH 5 value '20000'.

lv_1 = lv_1 + 1.

CONCATENATE lv_2 lv_1 into Data(lv_3) SEPARATED BY '-'.

write lv_3.
