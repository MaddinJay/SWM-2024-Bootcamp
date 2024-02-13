*&---------------------------------------------------------------------*
*& Report ZMB_MATHE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_mathe.

DATA: gv_zahl        TYPE i, "normale Variablendeklaration
      gv_dezimalzahl TYPE p DECIMALS 2 VALUE '4.2', "Variablendeklaration mit Nachkommastelle und vordefiniertem Wert
      gv_adresse     TYPE string,
*     gv_dezimalzahl2 LIKE gv_dezimalzahl,
*     gv_name         LIKE mara-ernam.


      CONSTANTSpi    TYPE p DECIMALS 2 VALUE '3.14'. "Konstante definieren und belegen!


WRITE gv_dezimalzahl.
WRITE / CONSTANTSpi.

DATA gv_var1 TYPE p DECIMALS 2.
DATA gv_var2 TYPE p DECIMALS 2.
DATA gv_erg TYPE p DECIMALS 2.

gv_var1 = 3.
gv_var2 = 5.

gv_erg = gv_var1 + gv_var2.

ADD gv_var1 TO gv_erg.

WRITE / gv_erg.

gv_erg = gv_var1 + gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 - gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 * gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 / gv_var2.

WRITE / gv_erg.
