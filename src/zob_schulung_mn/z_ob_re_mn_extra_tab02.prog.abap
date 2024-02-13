*&---------------------------------------------------------------------*
*& Report z_ob_re_mn_extra_tab02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_mn_extra_tab02.

DATA: BEGIN OF ls_werte,
        euro type p DECIMALS 2,
        dollar type p DECIMALS 2,
      END OF ls_werte,
      lt_werte LIKE TABLE OF ls_werte.

"fester Umrechnungskurs
CONSTANTS: lc_umrechnung TYPE p DECIMALS 2 VALUE '1.09'.

PARAMETERS: p_urk TYPE p DECIMALS 2 OBLIGATORY.

INITIALIZATION.
p_urk = lc_umrechnung.

START-OF-SELECTION.

DO 100 TIMES.
  "im ersten Schleifewndurchlauf ist der Wert Initial 0.00 , darum addieren wir hier 1 am Beginn
  ls_werte-euro = ls_werte-euro + 1.
  "Berechnung des Dollarkurses mit Hilfe der Umrechnung und des Euro-Wertes
  ls_werte-dollar = ls_werte-euro * p_urk.
  "neue Zeile an die Tabelle hängen
  APPEND ls_werte TO lt_werte.
ENDDO.

cl_demo_output=>display( lt_werte ).
