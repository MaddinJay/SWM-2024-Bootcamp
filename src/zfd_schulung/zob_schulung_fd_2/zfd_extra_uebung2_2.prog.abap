*&---------------------------------------------------------------------*
*& Report zfd_extra_uebung2_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_extra_uebung2_2.

*******************************
* EXTRA Stringlänge
*******************************
DATA lv_ersterSatz TYPE String VALUE 'Das ist der erste Satz.'.
DATA lv_zweiterSatz TYPE String VALUE 'Das ist der zweite Satz.'.
DATA lv_zahl1 TYPE i.
DATA lv_zahl2 TYPE i.

WRITE /.
lv_zahl1 = strlen( lv_ersterSatz ).
lv_zahl2 = strlen( lv_zweiterSatz ).

DATA(lv_zahl3) = lv_zahl2 - lv_zahl1.

WRITE: 'Unterschied der Länge :',lv_zahl3.

*******************************
* EXTRA Stringlänge 2
*******************************
*Replace ALL OCCURRENCES OF ''' 'Thus contumely, the native hue of resolution devoutly to others that flesh is heir to, tis nobler in that patient merit of troubles, and their to, tis a consience ofresolution devoutly to be wish d'
*lv_zahl1 = strlen( 'Thus contumely, the native hue of resolution devoutly to others that flesh is heir to, tis nobler in that patient merit of troubles, and their to, tis a consience ofresolution devoutly to be wish d' ).
*write: /, lv_zahl1.



*******************************
* EXTRA Palindrom
*******************************
CONSTANTS lc_elage TYPE string VALUE 'Egale Lage'.

*******************************
* EXTRA Schleife
*******************************
CONSTANTS lc_zahlc TYPE i VALUE 42.
DATA lv_zahl TYPE i VALUE 1.

Uline.
Write: 'Folgende Zahlen können ',lc_zahlc,'ganzzahlig teilen',/.
WHILE lv_zahl <= lc_zahlc.
  IF lc_zahlc MOD lv_zahl EQ 0.
      write lv_zahl.
  ENDIF.
  lv_zahl += 1.
ENDWHILE.
