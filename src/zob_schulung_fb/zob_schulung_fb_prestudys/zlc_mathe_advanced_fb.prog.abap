*&---------------------------------------------------------------------*
*& Report ZLC_MATHE_ADVANCED_FB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_mathe_advanced_fb.

DATA: gv_string TYPE string VALUE 'Hallo !',
      gv_zahl   Type i Value 5,
      gv_erg    TYPE p DECIMALS 2.

WRITE gv_string.

gv_string = gv_zahl.    "Funktionirt!

WRITE gv_string.

gv_string = '5'.

gv_zahl = gv_string.

gv_erg = gv_zahl * gv_string.

WRITE / gv_erg.
