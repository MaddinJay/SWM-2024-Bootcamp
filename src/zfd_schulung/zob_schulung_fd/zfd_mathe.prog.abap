*&---------------------------------------------------------------------*
*& Report ZFD_MATHE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_mathe.

DATA: gv_zahl1       TYPE i, "normale Variablendeklination
      gv_dezimalzahl TYPE p DECIMALS 2 VALUE '4.20', "normale Variablendeklination mit NAchkommastelle und vordefiniertem Wert
      gv_adresse     TYPE String.
*      gv_dezimalzahl2 LIKE gv_dezimalzahl,
*      gv_name         LIKE mara-ernam.

CONSTANTS gc_pi TYPE p DECIMALS 2 VALUE '3.14'.

*gc_pi = '4.20'. " Geht nicht , da Konstante

WRITE: gv_dezimalzahl,
       / gc_pi.

ULINE.

DATA: gv_var1 TYPE p DECIMALS 2,
      gv_var2 TYPE p DECIMALS 2,
      gv_erg  TYPE p DECIMALS 2.

gv_var1 = 3.
gv_var2 = 5.

gv_erg = gv_var1 + gv_var2.
*ADD gv_var1 TO gv_erg. Alternative Schreibweise der Addition
*gv_erg = gv_erg + gv_var1.
WRITE / gv_erg.

gv_erg = gv_var1 - gv_var2.
WRITE / gv_erg.

gv_erg = gv_var1 * gv_var2.
WRITE / gv_erg.

gv_erg = gv_var1 / gv_var2.
WRITE / gv_erg.
