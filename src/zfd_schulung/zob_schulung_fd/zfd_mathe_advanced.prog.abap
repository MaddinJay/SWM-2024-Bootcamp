*&---------------------------------------------------------------------*
*& Report ZFD_MATHE_ADVANCED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_mathe_advanced.

*DATA: gv_string TYPE String value 'Hello!',
*      gv_zahl   TYPE i VALUE 5,
*      gv_erg    TYPE p Decimals 2.
*
*WRITE gv_string.
*
*gv_string = gv_zahl. "Funktioniert!
*WRITE gv_string.
*
*gv_string = '5'.
*
*gv_zahl = gv_string.
*
*gv_erg = gv_zahl * gv_string.
*
*WRITE / gv_erg.
*
*uline.
*WRITE 'Franks Testfeld:'.
*gv_zahl = '3.6'.
*write / gv_zahl.
*
*gv_string = gv_zahl.
*WRITE / gv_string.
*
*ULINE.

DATA gv_zahl1 TYPE p DECIMALS 2 VALUE 7.
DATA gv_zahl2 TYPE p DECIMALS 2 VALUE 2.
DATA gv_erg TYPE p DECIMALS 2.

gv_erg = gv_zahl1 / gv_zahl2.
WRITE gv_erg.

gv_erg = gv_zahl1 DIV gv_zahl2.
WRITE gv_erg.

gv_erg = gv_zahl1 MOD gv_zahl2.
WRITE gv_erg.

gv_erg = gv_zahl1 ** gv_zahl2. " Potenzieren:  7 hoch 2
WRITE gv_erg.
