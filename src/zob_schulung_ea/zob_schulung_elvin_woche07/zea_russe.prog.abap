*&---------------------------------------------------------------------*
*& Report zea_russe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zea_russe.

DATA: gv_startzahl  TYPE p DECIMALS 0 VALUE 47,
      gv_startzahl2 TYPE p DECIMALS 0 VALUE 42,
      gv_ergebnis   TYPE p DECIMALS 0,
      gv_temp1      TYPE p DECIMALS 0,
      gv_temp2      TYPE p DECIMALS 0,
      gv_counter    TYPE p DECIMALS 0.


gv_ergebnis = 0.
gv_temp1 = gv_startzahl.
gv_temp2 = gv_startzahl2.

DO gv_counter TIMES.
   IF gv_temp1 MOD 2 = 1.
      gv_ergebnis = gv_ergebnis + gv_temp2.
   ENDIF.

gv_temp1 = gv_temp1 / 2.
gv_temp2 = gv_temp2 * 2.

   IF gv_temp1 = 0.
      EXIT.
   ENDIF.
ENDDO.

WRITE: / 'Multiplikation vin', gv_startzahl, 'und', gv_startzahl2, 'ist', gv_ergebnis.
