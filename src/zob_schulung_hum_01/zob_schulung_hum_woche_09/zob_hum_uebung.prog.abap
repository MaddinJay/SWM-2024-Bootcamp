*&---------------------------------------------------------------------*
*& Report zob_hum_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_hum_uebung.
DATA lv_count TYPE i VALUE 1.
DATA lv_toggle TYPE abap_bool VALUE abap_true.

WHILE lv_count <> 11.
  IF lv_toggle = abap_true.
    lv_count = lv_count + 3.
    lv_toggle = abap_false.
  ELSE.
    lv_count = lv_count + 2.
    lv_toggle = abap_true.
  ENDIF.
  WRITE lv_count.
ENDWHILE.
