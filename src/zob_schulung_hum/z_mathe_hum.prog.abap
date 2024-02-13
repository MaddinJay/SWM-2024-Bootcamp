*&---------------------------------------------------------------------*
*& Report Z_MATHE_HUM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_mathe_hum.

DATA: gv_zahl1       TYPE i, "noramle Variablendeklaration
      gv_dezimalzahl TYPE p DECIMALS 2 VALUE '4.25', "Variablendeklaration mit Nachkommastelle und vordefiniertem Wert
      gv_adresse     TYPE string.
*      gv_dezimalzahl2 LIKE gv_dezimalzahl."Like sollte sparsam bis gar nicht zu verwendet werden

CONSTANTS gc_pi TYPE p DECIMALS 2 VALUE '3.14'.
*gc_pi = '4.20'. "Geht nicht, da Konstante!!!

WRITE: gv_dezimalzahl,
       / gc_pi.

DATA gv_var1 TYPE p DECIMALS 2.
DATA gv_var2 TYPE p DECIMALS 2.
DATA gv_erg TYPE p DECIMALS 2.

gv_var1 = 3.
gv_var2 = 5.

gv_erg = gv_var1 + gv_var2.
ADD gv_var1 To gv_erg. "Besser Formelschreibweise zumindest am Anfang

WRITE  / gv_erg.
gv_erg = gv_var1 - gv_var2.

WRITE / gv_erg.
gv_erg = gv_var1 * gv_var2.

WRITE / gv_erg.
gv_erg = gv_var1 / gv_var2.

Write / gv_erg.
gv_erg = gv_var2 / gv_var1.

WRITE / gv_erg.
gv_erg = gv_var2 + gv_var1. "Warum wird dieses Ergebnis nicht angezeigt?

WRITE / 'Berechnungen fertig'.
