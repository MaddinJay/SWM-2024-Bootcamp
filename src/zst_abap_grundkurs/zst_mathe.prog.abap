*&---------------------------------------------------------------------*
*& Report ZST_MATHE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_mathe.

DATA: gv_zahl1        TYPE i, "Ganze Zahl
      gv_dezimalzahl TYPE p DECIMALS 2 VALUE '4.20', "Dezimal / Kommazahl + Nachkommastellen und vordefiniertem Wert
      gv_adresse     TYPE string."Zahlen / Buchstaben ohne Zeichenbegrenzung
*      gv_dezimalzahl2 Like gv_dezimalzahl. "bei größerem Code schwer nbachzuvollziehen welche Werte / welcher Value dahintersteckt

CONSTANTS gc_pi type p DECIMALS 2 VALUE '3.14'. "Konstante definieren und belegen
*gc_pi = '4.20' "Geht nicht, da Konstante!

WRITE: gv_dezimalzahl,
/ gc_pi.

Data gv_var1 Type p DECIMALS 2.
Data gv_var2 Type p DECIMALS 2.
Data gv_erg Type p DECIMALS 2.

gv_var1 = 3.
gv_var2 = 5.

GV_erg = gv_var1 + gv_var2.

Write / gv_erg.

GV_erg = gv_var1 - gv_var2.

Write / gv_erg.

GV_erg = gv_var1 * gv_var2.

Write / gv_erg.

GV_erg = gv_var1 / gv_var2.

Write / gv_erg.
