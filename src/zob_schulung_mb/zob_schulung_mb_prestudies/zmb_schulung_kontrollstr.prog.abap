*&---------------------------------------------------------------------*
*& Report zmb_schulung_kontrollstr
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_schulung_kontrollstr.

**********************************************************************
*Kontrollstrukturen: While-Schleife, Do-Schleife, Loop-Schleife
**********************************************************************

DATA(lv_zaehler) = 0.
WHILE lv_zaehler <= 9.
lv_zaehler = lv_zaehler + 1.
  IF lv_zaehler MOD 2 EQ 0.
WRITE: /, lv_zaehler, 'even'.
ELSE.
WRITE: /,lv_zaehler, 'odd'.
ENDIF.

ENDWHILE.



CONSTANTS lc_hello TYPE string VALUE 'Hello World!'.
CONSTANTS lc_text TYPE string VALUE 'Ich bin ein Text'.

Skip.
write: / lc_hello, lc_text.
