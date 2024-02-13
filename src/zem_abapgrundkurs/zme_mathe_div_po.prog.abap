*&---------------------------------------------------------------------*
*& Report ZME_MATHE_DIV_PO
*&MOD ausgabe mit richtigen Datentyp auch mit Komma---------------------------------------------------------------------*
*&HInweise nicht beachten...Report grundlegend geändert

*&---------------------------------------------------------------------*
REPORT zme_mathe_div_po.

DATA: gv_zahl1 TYPE p DECIMALS 3 VALUE '5.23',
 gv_zahl2 TYPE p DECIMALS 3  VALUE '2.34',
 gv_erg   TYPE p DECIMALS 3,
 gv_erg2  TYPE p DECIMALS 3,
gv_ergdiv TYPE p DECIMALS 3,
 gv_ergplus TYPE p DECIMALS 3.

gv_erg = gv_zahl1 / gv_zahl2. "normale Division

WRITE gv_erg.

gv_erg = gv_zahl1 DIV gv_zahl2. "ganzzahldivision

WRITE gv_erg.

gv_erg = gv_zahl1 MOD gv_zahl2."restwert aus division


WRITE gv_erg.

gv_erg = gv_zahl1 ** gv_zahl2. "Potenz

WRITE gv_erg.

gv_erg = gv_zahl1 DIV gv_zahl2. "ganzzahldivision

gv_erg2 = gv_zahl1 MOD gv_zahl2."restwert aus division



ADD gv_erg to gv_erg2.

gv_ergplus = gv_erg + gv_erg2. "spielerei,
gv_ergdiv = gv_ergplus / gv_zahl2. "zum ursprungsergebnis

Write: gv_ergdiv.

gv_erg2 = gv_zahl1 MOD gv_zahl2."restwert aus division
