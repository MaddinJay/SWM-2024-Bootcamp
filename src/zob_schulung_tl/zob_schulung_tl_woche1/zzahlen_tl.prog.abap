*&---------------------------------------------------------------------*
*& Report zzahlen_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zzahlen_tl.

DATA: lv_zahl1 TYPE p DECIMALS 2 VALUE '15.55',
      lv_zahl2 TYPE i VALUE 4,
      lv_erg TYPE p DECIMALS 2.
      "Summe der beiden Zahlen
      lv_erg = lv_zahl1 + lv_zahl2.
      WRITE: 'Ergebnis Summe: ',lv_erg.

      "Berechnen Sie das Produkt (*) beiden Zahlen
      lv_erg = lv_zahl1 * lv_zahl2.
      WRITE: /,'Ergebnis Produkt: ',lv_erg.

      "Zwischenergebnisse ausgeben
