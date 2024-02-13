*&---------------------------------------------------------------------*
*& Report ZAW_MATHE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_mathe.

DATA: gv_zahl1       TYPE i, "normale Variablendeklaration für ganze Zahl
      gv_dezimalzahl TYPE p DECIMALS 2 VALUE '4.20', "Variablendekl. mit Nachkommastellen und vordefiniertem Wert
      gv_adresse     TYPE string.

CONSTANTS gc_pi TYPE p DECIMALS 2 VALUE '3.14'. "globale Konstante

*gc_pi = '4.20'. "Geht nicht, da Konstante!

WRITE: gv_dezimalzahl,
       / gc_pi.

DATA: gv_var1 TYPE p DECIMALS 2.
DATA: gv_var2 TYPE p DECIMALS 2.
DATA: gv_erg TYPE p DECIMALS 2.

gv_var1 = 3.
gv_var2 = 5.

gv_erg = gv_var1 + gv_var2. "Addition +

ADD gv_var1 TO gv_erg. "-> gv_erg = gv_erg + gv_var1

WRITE / gv_erg.

gv_erg = gv_var1 - gv_var2. "Subtraktion -

WRITE / gv_erg.

gv_erg = gv_var1 * gv_var2. "Multiplikation *

WRITE / gv_erg.

gv_erg = gv_var1 / gv_var2. "Division /

WRITE / gv_erg.
