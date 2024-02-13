*&---------------------------------------------------------------------*
*& Report zob_uebung_extra4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_extra4.

*Deklarieren Sie eine Variable mit dem Wert 'Hallihallo ich bin ein echter Satz.'.
*Verändern Sie den Satz das Sie nur noch 'Hallo ein Satz.' ausgeben.

Data: lv_text type string value 'Hallihallo ich bin ein echter Satz.'.
replace 'Hallihallo ich bin ein echter Satz.' in lv_text with 'Hallo ein Satz.'.
write lv_text.

*Deklarieren Sie zwei Zahlen a und b und geben Sie ihnen beliebige Werte.
*Lassen Sie sich den folgenden Text ausgeben. Ersetzen Sie a, b und c mit den
*Zahlenwerten. c ist die Summe aus a und b.
*'Die Summe aus a und b ist c.'

Data: lv_zahla type i value 1,
      lv_zahlb type i value 2,
      lv_zahlc type i.

 lv_zahlc = lv_zahla + lv_zahlb.

write: / |Die Summe aus { lv_zahla } und { lv_zahlb } ist { lv_zahlc }|.

"Geben sie das kleine Einmaleins aus.
DATA: result TYPE i.

DO 10 TIMES. " Äußere Schleife für die Zeilen
  DO 10 TIMES. " Innere Schleife für die Spalten
    result = sy-index * sy-loopc. " Multiplizieren der aktuellen Zeilen- und Spaltennummer
    WRITE: / sy-index, 'x', sy-loopc, '=', result.
  ENDDO.
  WRITE: /.
ENDDO.
