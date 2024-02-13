*&---------------------------------------------------------------------*
*& Report ZME_MATHE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zme_mathe.

DATA: gv_dezimal TYPE p DECIMALS 2 VALUE '2.23',
      gv_text    TYPE string VALUE 'x3',
      gv_erg     TYPE p DECIMALS 2.

CONSTANTS gc_zahl TYPE n VALUE 2.

gv_erg = gv_dezimal * gc_zahl.

ADD gv_dezimal TO gv_erg.

WRITE: gv_dezimal, gv_text, gv_erg.
