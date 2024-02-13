*&---------------------------------------------------------------------*
*& Report zuh_uebung_22_11_2023_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_uebung_22_11_2023_2.
*Deklarieren Sie eine Tabelle mit zwei Spalten (Euro und Doller).
*Befüllen Sie die erste Spalte der Tabelle mit den Zahlen 1 -100.
*Recherchieren Sie den Umrechnungskurs von Euro zu Doller.
*Ermitteln Sie für jeden Euro Wert (jede Zeile der Tabelle) den äquivalenten
*Dollar Wert und schreiben Sie ihn in die Tabelle.
*Lassen Sie sich die Tabelle ausgeben.

DATA: BEGIN OF ls_waehrung,
        lv_euro   TYPE p DECIMALS 2,
        lv_dollar TYPE p DECIMALS 2,
      END OF ls_waehrung.

DATA lt_waehrung LIKE TABLE OF ls_waehrung.

*CONSTANTS: lc_kurs TYPE p DECIMALS 2 VALUE '1.09'.

DO 100 TIMES.

  ls_waehrung-lv_euro = ls_waehrung-lv_euro + 1.
*  ls_waehrung-lv_dollar = ls_waehrung-lv_euro * lc_kurs.
  APPEND ls_waehrung TO lt_waehrung.
ENDDO.

PARAMETERS lc_kurs TYPE p DECIMALS 2.


LOOP AT lt_waehrung INTO ls_waehrung.
  ls_waehrung-lv_dollar = ls_waehrung-lv_euro * lc_kurs.
  MODIFY lt_waehrung FROM ls_waehrung.
ENDLOOP.


cl_demo_output=>display( lt_waehrung ).
