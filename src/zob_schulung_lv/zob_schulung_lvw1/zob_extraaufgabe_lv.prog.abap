*&---------------------------------------------------------------------*
*& Report zob_extraaufgabe_lv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_extraaufgabe_lv.

DATA: gv_dezimalzahl TYPE p DECIMALS 2 VALUE '15.55', "beachte die schreibweise , oder . bei englisch deutsch
      gv_integerzahl TYPE i VALUE 4,
      gv_ergebnisdecimals TYPE i.

  gv_ergebnisdecimals = gv_integerzahl + gv_dezimalzahl.
  WRITE gv_ergebnisdecimals.


  CLEAR gv_ergebnisdecimals.
  gv_ergebnisdecimals = gv_integerzahl * gv_dezimalzahl.
  WRITE / gv_ergebnisdecimals.


*  CLEAR gv_ergebnisdecimals.
*  gv_ergebnisdecimals = gv_integerzahl / gv_dezimalzahl.
*  WRITE / gv_ergebnisdecimals.
*
