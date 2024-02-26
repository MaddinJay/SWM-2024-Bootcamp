*&---------------------------------------------------------------------*
*& Report ZTW_MATHE_ADVANCED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_mathe_advanced.

DATA gv_zahl1 TYPE p DECIMALS 2 VALUE 7.
DATA gv_zahl2 TYPE p DECIMALS 2 VALUE 2.
DATA gv_erg TYPE p DECIMALS 2.

gv_erg = gv_zahl1 / gv_zahl2.
WRITE / gv_erg.

gv_erg = gv_zahl1 DIV gv_zahl2.
WRITE / gv_erg.

gv_erg = gv_Zahl1 MOD gv_zahl2.
WRITE / gv_erg.

gv_erg = gv_zahl1 ** gv_zahl2 .
Write gv_erg.
