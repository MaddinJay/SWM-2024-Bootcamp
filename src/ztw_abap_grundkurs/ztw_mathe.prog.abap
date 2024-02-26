*&---------------------------------------------------------------------*
*& Report ZTW_MATHE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTW_MATHE.

DATA: gv_zahl1 TYPE i,
gv_dezimalzahl TYPE p DECIMALS 2 VALUE '4.20',
gv_adresse TYPE string.
*gv_dezimalzahl2 LIKE gv_dezimalzahl,
*gv_name LIKE

CONSTANTS gc_pi TYPE p DECIMALS 2 VALUE '3.14'.

WRITE: gv_dezimalzahl,
/ gc_pi.
DATA: gv_var1 TYPE p DECIMALS 2.
DATA: gv_var2 TYPE p DECIMALS 2.
DATA: gv_erg  TYPE p DECIMALS 2.

gv_var1 = 3.
gv_var2 = 5.

gv_erg = gv_var1 + gv_var2.
ADD gv_var1 TO gv_erg.
WRITE / gv_erg.
