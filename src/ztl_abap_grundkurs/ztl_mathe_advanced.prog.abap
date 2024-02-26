*&---------------------------------------------------------------------*
*& Report ZTL_MATHE_ADVANCED
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTL_MATHE_ADVANCED.
"Das untere ist von Video (16) Konevntierung
*&DATA: gv_string TYPE string VALUE 'Hallo!',
*&      gv_zahl TYPE i VALUE 5,
*&     gv_erg TYPE p DECIMALS 2.

*&WRITE gv_string.

*&gv_string = gv_zahl. "Funktioniert!

*&WRITE gv_string.

*&gv_string = '5'.

*&gv_zahl = gv_string.

*&gv_erg = gv_zahl * gv_string.

*&WRITE / gv_erg.

"Nachfolgendes ist von Video (17) Erweiterte arithmetische Operation

DATA gv_zahl1 TYPE p DECIMALS 2 VALUE 7.
DATA gv_zahl2 TYPE p DECIMALS 2 VALUE 2.
DATA gv_erg TYPE p DECIMALS 2.

gv_erg = gv_zahl1 / gv_zahl2.
WRITE gv_erg.

gv_erg = gv_zahl1 DIV gv_zahl2. "DIV steht für Division es schaut wie oft kommt 2 in 3 rein und dann kommt 1.0 als ergebnis weil geht nur einmal
WRITE gv_erg.

gv_erg = gv_zahl1 MOD gv_zahl2. "das schaut wie viel fehlt um eine ganze zahl zu kriegen also 2 passt 1mal in 3 rein und dann bleibt noch 0.5 also muss man noch eine ganze zahl haben also ist ergebnis 1
WRITE gv_erg.

gv_erg = gv_zahl1 ** gv_zahl2. "** steht für Potenzieren 7hoch2 von rechts nach links
WRITE gv_erg.
