*&---------------------------------------------------------------------*
*& Report ZBV_MATHE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBV_MATHE.

DATA: gv_zahl1 TYPE i, "normale Variablendeklaration
      gv_dezimahlzahl TYPE p DECIMALS 2 VALUE '4.20', "Variablendeklaration mit Nachkommastelle und vordefiniertem Wert
      gv_adresse TYPE string.
*      gv_dezimalzahl2 LIKE gv_dezimahlzahl,
*      gv_name LIKE mara-ernam.

CONSTANTS gc_pi TYPE p DECIMALS 2 VALUE '3.14'. "Konstante definieren und belegen!

*gc_pi = '4.20'. "Geht nicht, da Konstante!

WRITE: gv_dezimahlzahl,
        / gc_pi.

DATA gv_var1 TYPE p DECIMALS 2.
DATA gv_var2 TYPE p DECIMALS 2.
DATA gv_erg TYPE p DECIMALS 2.

gv_var1 = 3.
gv_var2 = 5.

gv_erg = gv_var1 + gv_var2.

*ADD gv_var1 TO gv_erg. "Alternative Schreibweise der Addition
*gv_erg = gv_erg + gv_var1.

WRITE / gv_erg.

gv_erg = gv_var1 - gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 * gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 / gv_var2.

WRITE / gv_erg.
