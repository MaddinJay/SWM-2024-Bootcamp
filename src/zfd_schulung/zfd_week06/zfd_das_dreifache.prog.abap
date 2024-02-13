*&---------------------------------------------------------------------*
*& Report zfd_das_dreifache
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_das_dreifache.

Data lv_zahl type i Value 3.
perform das_dreifache CHANGING lv_zahl.
write lv_zahl.

FORM das_dreifache changing iv_zahl type i.
  iv_zahl = iv_zahl * 3.
endform.
