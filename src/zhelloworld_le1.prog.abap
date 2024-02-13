*&---------------------------------------------------------------------*
*& Report ZHELLOWORLD_LE1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhelloworld_le1.
WRITE: / 'Hello world'.
DATA gv_test TYPE string.
gv_test = 'ananas'.
WRITE: / gv_test.
WRITE: / 'omg, endlich'.
DATA gv_zahl1 TYPE p DECIMALS 5.
WRITE: / gv_zahl1.
DATA gv_zahl2 TYPE n VALUE '4'.
WRITE: / gv_zahl2.
DATA: gv_zahl3 TYPE p DECIMALS 2,
      gv_zahl4 TYPE n VALUE '5'.

SKIP 10. "überpsringt 10 zeilen
ULINE. "unterstreicht eine  zeile

CONSTANTS gc_pi TYPE p DECIMALS 2 VALUE '3.14'.

*gv_zahl4 + gv_zahl2 = gv_zahl3.
WRITE / gv_zahl3.
WRITE      / gc_pi.

DATA gv_var1 TYPE p DECIMALS 2.
DATA gv_var2 TYPE p DECIMALS 2.
DATA gv_var3 TYPE p DECIMALS 2.
DATA gv_erg TYPE p DECIMALS 2.

gv_var1 = '3'.
gv_var2 = '4'.

*gv_var1 + gv_var2 = gv_erg.
gv_erg = gv_var1 + gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 * gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 - gv_var2.

WRITE / gv_erg.

gv_erg = gv_var1 / gv_var2.

WRITE / gv_erg.



*PARAMETERS pa_name TYPE c LENGTH 12 DEFAULT 'HUGO'.
