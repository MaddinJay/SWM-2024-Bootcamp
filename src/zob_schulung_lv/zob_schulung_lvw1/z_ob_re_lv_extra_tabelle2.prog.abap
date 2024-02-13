*&---------------------------------------------------------------------*
*& Report z_ob_re_lv_extra_tabelle2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_lv_extra_tabelle2.
"struktur anlegen:
DATA: BEGIN OF ls_werte,
        euro   TYPE p DECIMALS 2,
        dollar TYPE p DECIMALS 2,
      END OF ls_werte,
      lt_werte LIKE TABLE OF ls_werte.
"strukturtyp bestimmt

"konstante eingabe wert des kurses

CONSTANTS: lc_umrechnung TYPE p DECIMALS 2 VALUE '1.09'.

"eingabefeld
PARAMETERS p_urk TYPE p DECIMALS 2 Obligatory.

"für eine vorbelegung. den wert vorgelegt.
INITIALIZATION.
p_urk = lc_umrechnung.

"events, die vorbelegung von 1.09, kann man aber auch ändern lassen können
START-OF-SELECTION.
"schleife 100 mal in ls_werte euro
DO 100 TIMES.
  ls_werte-euro = ls_werte-euro + 1.
  APPEND ls_werte TO lt_werte.
  ls_werte-dollar = ls_werte-euro * lc_umrechnung.
ENDDO.

cl_demo_output=>display( lt_werte ).
