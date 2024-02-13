*&---------------------------------------------------------------------*
*& Report zob_schulung_extr_einsetzen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_schulung_extr_einsetzen.

DATA: lv_summand_a TYPE i,
      lv_summand_b TYPE i,
      lv_summe_c TYPE i.

lv_summand_a = 4.
lv_summand_b = 3.

lv_summe_c = lv_summand_a + lv_summand_b.

*cl_demo_output=>display('Die Summe aus ' lv_summand_a , ' und ' , lv_summand_b , ' ist ' , lv_summe_c ).
WRITE: 'Die Summe aus ' , lv_summand_a , ' und ' , lv_summand_b , ' ist ' , lv_summe_c.
WRITE / |Die Summe aus { lv_summand_a } und { lv_summand_b } ist { lv_summe_c }|.
