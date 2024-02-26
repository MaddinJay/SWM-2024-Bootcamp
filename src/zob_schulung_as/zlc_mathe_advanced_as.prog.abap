*&---------------------------------------------------------------------*
*& Report ZLC_MATHE_ADVANCED_AS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_mathe_advanced_as.

DATA gv_zahl1 TYPE p DECIMALS 2 VALUE 7.
DATA gv_zahl2 TYPE p DECIMALS 2 VALUE 2.
DATA gv_erg TYPE p DECIMALS 2.

*gv_erg = gv_zahl1 / gv_zahl2.
*WRITE gv_erg.

*gv_erg = gv_zahl1 DIV gv_zahl2.
*WRITE gv_erg.

*gv_erg = gv_zahl1 MOD gv_zahl2.
*WRITE gv_erg.

gv_erg = gv_zahl1 ** gv_zahl2.
WRITE gv_erg.
