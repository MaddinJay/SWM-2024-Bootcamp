*&---------------------------------------------------------------------*
*& Report ZAW_MATHE_ADVANCED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_mathe_advanced.

DATA gv_zahl1 TYPE p DECIMALS 2 VALUE 7.
DATA gv_zahl2 TYPE p DECIMALS 2 VALUE 2.
DATA gv_erg TYPE p DECIMALS 2.

gv_erg = gv_zahl1 / gv_zahl2.
WRITE gv_erg. "Ergebnis 3,5

"-> ganzzahlige Division
gv_erg = gv_zahl1 DIV gv_zahl2.
WRITE gv_erg. "Ergebnis 3 (2 passt nur dreimal in die 7)

"-> Restwertdivision
gv_erg = gv_zahl1 MOD gv_zahl2.
WRITE gv_erg. "Ergebnis 1, da das der Rest ist (3 x 2 + Rest 1)

"-> Potenzierung
gv_erg = gv_zahl1 ** gv_zahl2.
Write gv_erg. "Ergebnis 49, da 7²
