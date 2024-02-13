*&---------------------------------------------------------------------*
*& Report ZLV_ARITHMETISCHE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLV_ARITHMETISCHE.

DATA gv_zahl1 TYPE p DECIMALS 2 VALUE '3'.
DATA gv_zahl2 TYPE p DECIMALS 2 VALUE '2'.
DATA gv_erg TYPE p DECIMALS 2.

gv_erg = gv_zahl1 / gv_zahl2.

WRITE gv_erg.

gv_erg = gv_zahl1 DIV gv_zahl2.
WRITE / gv_erg.

gv_erg = gv_zahl1 MOD gv_zahl2.
WRITE / gv_erg.

gv_erg = gv_zahl1 ** gv_zahl2. "3 hoch 2
WRITE / gv_erg. " 3 hoch zwei

gv_erg = gv_zahl2 ** gv_zahl1. "2 hoch 3
WRITE / gv_erg.
