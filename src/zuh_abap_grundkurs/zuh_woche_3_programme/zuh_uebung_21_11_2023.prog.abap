*&---------------------------------------------------------------------*
*& Report zuh_uebung_21_11_2023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_uebung_21_11_2023.
*******************************************************
* Extra Zahlen
*******************************************************
DATA: lv_zahl    TYPE p DECIMALS 2 VALUE '15.55',
      lv_zahl1   TYPE i VALUE 4,
      lv_summe   TYPE p DECIMALS 2,
      lv_produkt TYPE p DECIMALS 2.


lv_summe = lv_zahl + lv_zahl1.
lv_produkt = lv_zahl * lv_zahl1.

WRITE: 'Summe:', lv_summe, /, 'Produkt:', lv_produkt.
ULINE.

*******************************************************
* Extra String Manipulation I
*******************************************************
DATA: lv_text TYPE string VALUE ' In einem Loch im Boden, da lebte ein Hobbit.'.

WRITE lv_text.

REPLACE ALL OCCURRENCES OF 'e' IN lv_text WITH ''. "alle 'e' werden in lv_text durch '' ersetzt.
REPLACE ALL OCCURRENCES OF 'E' IN lv_text WITH ''. "alle 'E' werden in lv_text durch '' ersetzt.

WRITE: /, lv_text.
ULINE.
*******************************************************
* Extra Systemwert
*******************************************************
WRITE: 'System', sy-sysid, /, 'Mandant:' ,sy-mandt.
ULINE.
*******************************************************
* Extra Systemwerte II

*******************************************************
WRITE: 'Die aktuelle Zeit ist', sy-timlo,  'Uhr'.
ULINE.
*******************************************************
*Extra Kontrollstruktur
*******************************************************
*Geben Sie alle Zahlen zwischen 1 und 100 aus, welche ohne Rest durch 3 teilbar
*sind.

DATA(lv_zaehler) = 1.
WHILE lv_zaehler <= 100.
  IF lv_zaehler MOD 3 EQ 0.
    WRITE: / , 'Dreier Zahl:', lv_zaehler.
  ENDIF.
  lv_zaehler = lv_zaehler + 1.
ENDWHILE.
ULINE.

*******************************************************
*  Typdeklaration
*******************************************************
*Deklarieren Sie einen Integertyp der Länge 3.

DATA lv_number TYPE INT3.

lv_number = 123.
Write lv_number.
uline.
