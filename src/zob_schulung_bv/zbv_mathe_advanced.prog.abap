*&---------------------------------------------------------------------*
*& Report ZBV_MATHE_ADVANCED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_mathe_advanced.

*DATA: gv_string TYPE string VALUE 'Hallo!',
*      gv_zahl   TYPE i VALUE 5,
*      gv_erg TYPE p DECIMALS 2.
*
*WRITE gv_string.
*
*gv_string = gv_zahl. "Funktioniert!
*
*WRITE gv_string.
*
*gv_string = '5'.
*
*gv_zahl = gv_string.
*
*gv_erg = gv_zahl * gv_string.
*
*WRITE / gv_erg.

DATA gv_zahl1 TYPE p DECIMALS 2 VALUE 7.
DATA gv_zahl2 TYPE p DECIMALS 2 VALUE 2.
DATA gv_erg TYPE p DECIMALS 2.

gv_erg = gv_zahl1 / gv_zahl2.
WRITE gv_erg.

gv_erg = gv_zahl1 DIV gv_Zahl2.
WRITE gv_erg.

gv_erg = gv_zahl1 MOD gv_zahl2.
WRITE gv_erg.

gv_erg = gv_zahl2 ** gv_zahl1.
WRITE gv_erg.
