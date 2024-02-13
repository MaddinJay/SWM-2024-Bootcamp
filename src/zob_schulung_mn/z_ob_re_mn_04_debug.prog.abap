*&---------------------------------------------------------------------*
*& Report z_ob_re_mn_04_debug
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_mn_04_debug.

DATA: lv_test2 type string.
  "Break point setzen durch Doppelklick.

  DATA(lv_test) = |Test|.
  lv_test2 = 'Test'.

  lv_test = 'Dies ist ein Test'.
  lv_test2 = 'Dies ist ein Test'.

  WRITE lv_test.
  WRITE / lv_test2.
