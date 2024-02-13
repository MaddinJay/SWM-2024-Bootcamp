*&---------------------------------------------------------------------*
*& Report Z_MATHE_ADVANCED_HUM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_mathe_advanced_hum.

*
*DATA: gv_string TYPE string VALUE 'Hallo!',
*      gv_Zahl   TYPE i VALUE 5,
*      gv_erg    TYPE p DECIMALS 2.
*
*WRITE gv_String.
*
*gv_string = gv_zahl. " funktioniert!
*
*WRITE gv_string.
*
*gv_string = 'Hallo!'.
*
**gv_zahl = gv_string. "Konvertierungsfehler --> Laufzeitfehler
*
**gv_erg = gv_Zahl * gv_string. "ebenfalls Konvertierungsfehler

DATA: gv_zahl1 TYPE p DECIMALS 2 VALUE 7,
      gv_zahl2 TYPE p DECIMALS 2 VALUE 2,
      gv_erg   TYPE p DECIMALS 2.

gv_erg = gv_zahl1 / gv_zahl2.
WRITE gv_erg.

gv_erg = gv_zahl1 DIV gv_zahl2.
WRITE / gv_erg.

gv_erg = gv_zahl1 MOD gv_zahl2.
WRITE / gv_erg.

gv_erg = gv_zahl1 ** gv_zahl2. "7 hoch 2
WRITE / gv_erg.
