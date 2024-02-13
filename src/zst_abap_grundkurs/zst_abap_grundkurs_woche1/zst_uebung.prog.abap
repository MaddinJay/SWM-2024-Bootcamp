*&---------------------------------------------------------------------*
*& Report zst_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_uebung.
**********************************************************************
*Zahlen
**********************************************************************
DATA: lv_dezimal  TYPE p DECIMALS 2 VALUE '15.55',
      lv_zahl     TYPE i VALUE 4,
      lv_ergebnis TYPE p DECIMALS 2.

lv_ergebnis = lv_dezimal + lv_zahl.
WRITE lv_ergebnis.

lv_ergebnis = lv_dezimal * lv_zahl.
WRITE lv_ergebnis.
ULINE.
**********************************************************************
*String 1
**********************************************************************

DATA: lv_text TYPE string VALUE 'In einem Loch im Boden, da lebte ein Hobbit.'.
REPLACE ALL OCCURRENCES OF 'e' IN lv_text WITH ' '.
REPLACE ALL OCCURRENCES OF 'E' IN lv_text WITH ' '.

WRITE lv_text.
ULINE.

**********************************************************************
*Systemwert
**********************************************************************

WRITE: sy-sysid,/
sy-mandt.
ULINE.

**********************************************************************
*Systemwerte 2
**********************************************************************

WRITE: 'Die aktuelle Uhrzeit ist', sy-uzeit.
ULINE.

**********************************************************************
*Kontrollstruktur
**********************************************************************

DATA(lv_zaehler) = 1.
DO 100 TIMES.
  IF lv_zaehler MOD 3 EQ 0.
    WRITE lv_zaehler.
  ENDIF.
  lv_zaehler = lv_zaehler + 1.
ENDDO.
ULINE.

**********************************************************************
*Typdeklaration
**********************************************************************
TYPES: lv_typ TYPE int1.
ULINE.

**********************************************************************
*Struktur + Tabelle
**********************************************************************

TYPES: BEGIN OF lty_s_teilnehmer,
         id          TYPE lv_typ,
         vorname(30) TYPE c,
         ersterb     TYPE c,
         alter(3)    TYPE p,
         softskills  TYPE string,
       END OF lty_s_teilnehmer.
DATA: ls_teilnehmer TYPE lty_s_teilnehmer.
DATA lt_teilnehmer TYPE TABLE OF lty_s_teilnehmer.

ls_teilnehmer-id = 001.
ls_teilnehmer-vorname = 'Monika'.
ls_teilnehmer-ersterb = 'T'.
ls_teilnehmer-alter = '34'.
ls_teilnehmer-softskills = 'Empatisch'.
APPEND ls_teilnehmer TO lt_teilnehmer.
CLEAR ls_teilnehmer.

ls_teilnehmer-id = 002.
ls_teilnehmer-vorname = 'Markus'.
ls_teilnehmer-ersterb = 'K'.
ls_teilnehmer-alter = '58'.
ls_teilnehmer-softskills = 'Organisiert'.
APPEND ls_teilnehmer TO lt_teilnehmer.
CLEAR ls_teilnehmer.

ls_teilnehmer-id = 003.
ls_teilnehmer-vorname = 'Andreas'.
ls_teilnehmer-ersterb = 'K'.
ls_teilnehmer-alter = '37'.
ls_teilnehmer-softskills = 'Durchsetzungsstark'.
APPEND ls_teilnehmer TO lt_teilnehmer.
CLEAR ls_teilnehmer.

ls_teilnehmer-id = 004.
ls_teilnehmer-vorname = 'Sebastian'.
ls_teilnehmer-ersterb = 'T'.
ls_teilnehmer-alter = '37'.
ls_teilnehmer-softskills = 'Freundlich'.
APPEND ls_teilnehmer TO lt_teilnehmer.
CLEAR ls_teilnehmer.

ls_teilnehmer-id = 005.
ls_teilnehmer-vorname = 'Maximilian'.
ls_teilnehmer-ersterb = 'T'.
ls_teilnehmer-alter = '37'.
ls_teilnehmer-softskills = 'Vorrausschauend'.
APPEND ls_teilnehmer TO lt_teilnehmer.
CLEAR ls_teilnehmer.

ls_teilnehmer-id = 006.
ls_teilnehmer-vorname = 'Susanne'.
ls_teilnehmer-ersterb = 'T'.
ls_teilnehmer-alter = '34'.
ls_teilnehmer-softskills = 'Strukturiert'.
APPEND ls_teilnehmer TO lt_teilnehmer.


LOOP AT lt_teilnehmer INTO ls_teilnehmer.
  WRITE: 'Personal ID:', ls_teilnehmer-id, /
         'Vorname:', ls_teilnehmer-vorname, /
         'Erster Buchstabe des Nachnamens:', ls_teilnehmer-ersterb, /
         'Alter:', ls_teilnehmer-alter, /
         'Softskills:', ls_teilnehmer-softskills, /.
ENDLOOP.

cl_demo_output=>display(  lt_teilnehmer ).
ULINE.

**********************************************************************
*Tabelle mit Umrechnung
**********************************************************************

TYPES: BEGIN OF lty_s_umrechnung,
         euro   TYPE p DECIMALS 2,
         dollar TYPE p DECIMALS 2,
       END OF lty_s_umrechnung.
DATA: ls_umrechnung TYPE lty_s_umrechnung.
DATA lt_umrechnung TYPE TABLE OF lty_s_umrechnung.

ls_umrechnung-euro = 1.
CONSTANTS: lc_umrechnung TYPE p DECIMALS 2 VALUE '1.09'.

PARAMETERS p_umr TYPE p DECIMALS 2 OBLIGATORY.

INITIALIZATION.
  p_umr = lc_umrechnung.

START-OF-SELECTION.

  ls_umrechnung-dollar = ls_umrechnung-euro * p_umr.

  DO 100 TIMES.
    WRITE: /'Euro', ls_umrechnung-euro,
*  'Umrechnungskurs', ls_umrechnung-umr,
    'Dollar', ls_umrechnung-dollar.
    ULINE.
    ls_umrechnung-euro = ls_umrechnung-euro + 1.
    ls_umrechnung-dollar = ls_umrechnung-euro * p_umr.
    APPEND ls_umrechnung TO lt_umrechnung.
  ENDDO.

*cl_demo_output=>display( lt_umrechnung ).
  ULINE.

**********************************************************************
*Einsetzen
**********************************************************************

  DATA: lv_zahla TYPE p DECIMALS 2 VALUE '15.55',
        lv_zahlb TYPE p DECIMALS 2 VALUE 4,
        lv_zahlc TYPE p DECIMALS 2.

  lv_zahlc = lv_zahla + lv_zahlb.

  WRITE: 'Die Summe aus', lv_zahla, 'und', lv_zahlb, 'ist', lv_zahlc.

  WRITE: / |Die Summe aus { lv_zahla } und { lv_zahlb } ist { lv_zahlc }|.

  ULINE.

**********************************************************************
*Typendeklaration 2
**********************************************************************
  TYPES: BEGIN OF lty_s_typ2,
           sprachkuerzel(2) TYPE c,
           text             TYPE string,
         END OF lty_s_typ2.
  DATA: ls_typ2 TYPE lty_s_typ2.
  DATA lt_typ2 TYPE TABLE OF lty_s_typ2.


lt_typ2 = value #(
( sprachkuerzel = 'DE' Text = 'Deutscher Text' )
( sprachkuerzel = 'AT' Text = 'Österreichischer Text' )
( sprachkuerzel = 'EN' Text = 'Englischer Text' )
( sprachkuerzel = 'ES' Text = 'Spanischer Text' )
( sprachkuerzel = 'IT' Text = 'Italiensischer Text' )
).


cl_demo_output=>display( lt_typ2 ).
