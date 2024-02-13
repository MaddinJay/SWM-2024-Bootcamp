*&---------------------------------------------------------------------*
*& Report zextra_aufgaben_t3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zextra_aufgaben_t3.
************************************************************************
* Aufgabe:
*Tabelle 2 Spalten --> EUR und $
*Erste Spalte der Tabelle mit den Zahlen 1 -100.
*Umrechnungskurs von EUR in $ = 1.09 Dollar ergibt 1 EUR
*Für jeden EUR Wert das Wert in Dollar und in Tabelle schreiben
************************************************************************
DATA: BEGIN OF ls_struktur,
        euro   TYPE int1,
        dollar TYPE p DECIMALS 2,
      END OF ls_struktur,
      lt_tabelle LIKE TABLE OF ls_struktur.

PARAMETERS p_kurs TYPE p DECIMALS 2 OBLIGATORY.

"So werden die Zahlen von 1 bis 100 in der Tabelle angezeigt:
DATA zahl TYPE int1 VALUE 1.
DO 100 TIMES.
  ls_struktur-euro = zahl.
  ls_struktur-dollar = zahl * p_kurs.
  APPEND ls_struktur TO lt_tabelle.
  zahl = zahl + 1.
ENDDO.


cl_demo_output=>display(
data = lt_tabelle ).
