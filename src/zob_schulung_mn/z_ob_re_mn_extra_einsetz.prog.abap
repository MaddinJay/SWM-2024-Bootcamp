*&---------------------------------------------------------------------*
*& Report z_ob_re_mn_extra_einsetz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_mn_extra_einsetz.

DATA: lv_summand_a TYPE i,
      lv_summand_b TYPE i,
      lv_summe_c TYPE i.

lv_summand_a = 4.
lv_summand_b = 3.

lv_summe_c = lv_summand_a + lv_summand_b.

WRITE: 'Die Summe aus ',lv_summand_a, ' und ', lv_summand_b, 'ist ', lv_summe_c.
WRITE / |Die Summe aus { lv_summand_a } und { lv_summand_b } ist { lv_summe_c }|.

"Die Summe aus 4 und 3 ist 7
