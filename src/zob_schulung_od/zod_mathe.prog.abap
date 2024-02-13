*&---------------------------------------------------------------------*
*& Report ZOD_MATHE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOD_MATHE.

DATA: gv_zahl1 TYPE i, "normale Deklaration
      gv_dezimalzahl TYPE p DECIMALS 2 VALUE '2.20', "Variabledeklaration mit Nachkommastelle und vordefiniertem Wert
      gv_adresse TYPE string.

      CONSTANTS gc_pi TYPE p DECIMALS 2 VALUE '3.14'. "Konstante definieren und belegen
      "Konstante kann nach der Denifinition nicht verändert werden
*      gc_pi = '4.20' "geht nicht, da Konstante
WRITE: gv_dezimalzahl,
       / gc_pi.

DATA gv_var1 TYPE p DECIMALS 2 .
DATA gv_var2 TYPE p DECIMALS 2 .
DATA gv_erg TYPE p DECIMALS 2 .

gv_var1 = 3.
gv_var2 = 5.

gv_erg = gv_var1 + gv_var2.

*ADD gv_var1 TO gv_erg. "Alternative Schreibweise der Addition
*gv_erg = gv_erg + gv_var1.

WRITE / gv_erg.

gv_erg = gv_var1 - gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 / gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 * gc_pi.

WRITE / gv_erg.
