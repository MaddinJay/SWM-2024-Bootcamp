*&---------------------------------------------------------------------*
*& Report zaw_uebung_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_02.

* Deklarieren Sie eine Tabelle mit zwei Spalten (Euro und Dollar).
* Befüllen Sie die erste Spalte der Tabelle mit den Zahlen 1-100.

DATA: BEGIN OF ls_umrechnung,
        euro   TYPE p DECIMALS 2,
        dollar TYPE p DECIMALS 2,
      END OF ls_umrechnung,
      lt_umrechnung LIKE TABLE OF ls_umrechnung.

DATA: lv_euro type p DECIMALS 2 value 0.

* CONSTANTS lc_umrechnung TYPE p DECIMALS 2 VALUE '1.09'.
PARAMETERS: p_umrech TYPE p DECIMALS 2 OBLIGATORY.

WRITE: |Umrechnungsfaktor: { p_umrech }|,
/.

DO 100 TIMES.
  lv_euro = lv_euro + 1.
  ls_umrechnung-dollar = lv_euro * p_umrech.
  APPEND ls_umrechnung TO lt_umrechnung.
  WRITE: / |{ lv_euro } € -> { ls_umrechnung-dollar } $|.
ENDDO.
