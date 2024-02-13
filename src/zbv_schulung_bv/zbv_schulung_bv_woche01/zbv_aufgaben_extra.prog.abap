*&---------------------------------------------------------------------*
*& Report zbv_aufgaben_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_aufgaben_extra.

**********************************************************************
*Aufgabe Manipulation
**********************************************************************

DATA: lv_zahl TYPE p DECIMALS 2 VALUE '15.55',
      lv_zahl2 TYPE i VALUE 4,
      lv_erg TYPE p DECIMALS 2,
      lv_erg2 TYPE p DECIMALS 2.

lv_erg = lv_zahl + lv_zahl2.

lv_erg2 = lv_zahl * lv_zahl2.

WRITE: 'Summe: ', lv_erg, / , 'Produkt: ', lv_erg2.

**********************************************************************
*Aufgabe String Manipulation I
**********************************************************************
DATA lv_text TYPE string VALUE 'In einem Loch im Boden, da lebte ein Hobbit.'.

REPLACE ALL OCCURRENCES OF 'e' IN lv_text WITH ' '.
REPLACE ALL OCCURRENCES OF 'E' IN lv_text WITH ' '. "Man muss bei Groß- und Kleinschriebung immer separat machen, da es sonst nicht ersetzt.

WRITE / lv_text.

**********************************************************************
*Aufgabe Systemwert
**********************************************************************

WRITE / sy-sysid.
WRITE / sy-mandt.

**********************************************************************
*Aufgabe Systemwert II
**********************************************************************

WRITE: / 'Die aktuelle Uhrzeit ist: ', sy-uzeit.
