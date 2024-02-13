*&---------------------------------------------------------------------*
*& Report zbl_einsetzen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_einsetzen.

DATA: lv_zahl1 TYPE i VALUE 11,
      lv_zahl2 TYPE i VALUE 5,
      lv_ergebnis TYPE i.

      lv_ergebnis = lv_zahl1  +  lv_zahl2.


      WRITE: 'Die Summe aus', lv_zahl1,'und', lv_zahl2,'ist', lv_ergebnis,'.'.
