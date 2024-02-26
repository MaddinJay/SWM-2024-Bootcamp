*&---------------------------------------------------------------------*
*& Report ZLC_MATHE_AS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_mathe_as.

DATA: gv_zahl1        TYPE i, "i steht für ganze Zahlen, normale Variablendeklaration"
      gv_dezimalzahl  TYPE p DECIMALS 2 VALUE '4.20', "p steht für Dezimalzahlen, Variablendeklaration mit Nachkommastelle und vordefiniertem Wert"
      gv_adresse      TYPE string,
      gv_dezimalzahl2 LIKE gv_dezimalzahl. "dezimalzahl2 ist wie dezimalzahl"

constants gc_pi TYPE p DECIMALS 2 value '3.14'. "Konstante mit gc definiert. gc = global constants.
                                                "Die Konstante muss direkt bei der Deklaration mit einem Wert belegt werden.

"gc_pi = '4.20'. Geht nicht, da es eine Konstante ist."

*WRITE: gv_dezimalzahl,
*/ gc_pi.

"Ausgabe ist rechtsbündig, weil Dezimalzahl"

data gv_var1 TYPE p DECIMALS 2.
data gv_var2 TYPE p DECIMALS 2.
data gv_erg TYPE p DECIMALS 2.

gv_var1 = 3.
gv_var2 = 5.

gv_erg = gv_var1 + gv_var2.


add gv_var1 to gv_erg.

WRITE / gv_erg.


""
gv_erg = gv_var1 + gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 - gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 * gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 / gv_var2.

WRITE / gv_erg.
