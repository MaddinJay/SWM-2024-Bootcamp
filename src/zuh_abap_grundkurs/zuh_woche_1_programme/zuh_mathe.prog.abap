*&---------------------------------------------------------------------*
*& Report ZUH_MATHE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_mathe.

DATA: gv_zahl1       TYPE i, "normale Variablendeklanation
      gv_dezimalzahl TYPE p DECIMALS 2 VALUE '4.20', "Variablendeklanation mit Nachkommastelle und vordefiniertem Wert
      gv_adresse     TYPE String.
* gv-dezimalzahl2 LIKE gv_dezimalzahl.

CONSTANTS gc_pi TYPE p DECIMALS 2 VALUE '3.14'. " Konstante definiert

*gc_pi = '4.20'. "Geht nicht, da Konstante!

WRITE: gv_dezimalzahl,
       / gc_pi.

DATA gv_var1 TYPE p DECIMALS 2.
DATA gv_var2 TYPE p DECIMALS 2.
DATA gv_erg TYPE p DECIMALS 2.

gv_var1 = 3.
gv_var2 = 5.

gv_erg = gv_var1 + gv_var2.

*ADD gv_var1 to gv_erg.  " alte schreibweise sollte man nur bedingt verwenden

write / gv_erg.

gv_erg = gv_var1 - gv_var2.

write / gv_erg.

gv_erg = gv_var1 * gv_var2.

write / gv_erg.

gv_erg = gv_var1 / gv_var2.

write / gv_erg.
