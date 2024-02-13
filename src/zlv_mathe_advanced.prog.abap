*&---------------------------------------------------------------------*
*& Report ZLV_MATHE_ADVANCED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLV_MATHE_ADVANCED.


DATA: gv_string TYPE string VALUE 'Hallo'.
DATA: gv_zahl1 TYPE i VALUE 5.

WRITE: gv_string.

gv_string = gv_zahl1.
WRITE: / gv_string.

gv_string = '5'.
gv_zahl1 = gv_string.
WRITE: / gv_string.

DATA gv_erg TYPE p DECIMALS 2.
gv_erg = gv_zahl1 * gv_string.

WRITE: gv_erg.
