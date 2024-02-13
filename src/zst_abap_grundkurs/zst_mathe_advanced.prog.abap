*&---------------------------------------------------------------------*
*& Report ZST_MATHE_ADVANCED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_mathe_advanced.

Data gv_zahl1 TYPE p DECIMALS 2 Value 7.
Data gv_zahl2 TYPE p DECIMALS 2 Value 2.
Data gv_erg TYPE p DECIMALS 2.

gv_erg = gv_zahl1 / gv_zahl2.
Write gv_erg.

gv_erg = gv_zahl1 div gv_zahl2. "Ganzzahldivision (wie oft passt 2 in 7 = 3)
WRITE gv_erg.

gv_erg = gv_zahl1 MOD gv_zahl2. "Restwertdivision (wie viel bleibt übrig wenn die 2 so oft wie möglich in die 7 ging = 1)
Write gv_erg.

gv_erg = gv_zahl1 ** gv_zahl2. "Potenzierung (in diesem Fall 7 hoch 2, also 7*7 = 49)
Write gv_erg.
