*&---------------------------------------------------------------------*
*& Report zuh_uebung_23_11_2023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_uebung_23_11_2023.

*******************************************************
* Einsetzen
*******************************************************
*Deklarieren Sie zwei Zahlen a und b und geben Sie ihnen beliebige Werte.
*Lassen Sie sich den folgenden Text ausgeben. Ersetzen Sie a, b und c mit den
*Zahlenwerten. c ist die Summe aus a und b.
*'Die Summe aus a und b ist c.'

DATA: lv_zahl1 TYPE i VALUE 4,
      lv_zahl2 TYPE i VALUE 5,
      lv_summe TYPE i.

lv_summe = lv_zahl1 + lv_zahl2.

WRITE: 'Die Summe aus', lv_zahl1, 'und', lv_zahl2, 'ist', lv_summe.

WRITE |Die Summe aus { lv_zahl1 } und { lv_zahl2 } ist { lv_summe }|.
