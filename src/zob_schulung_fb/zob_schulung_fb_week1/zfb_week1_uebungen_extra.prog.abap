*&---------------------------------------------------------------------*
*& Report zfb_week1_uebungen_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_week1_uebungen_extra.
*
****** PDF Extra Übungen         *****
****** Übung 1                   *****
****** Extra: Zahlen             *****
*
*DATA: lv_dezi  TYPE p LENGTH 8 DECIMALS 2 VALUE '15.55',
*      lv_zahl  TYPE i VALUE '4',
*      lv_summe TYPE p LENGTH 8 DECIMALS 2,
*      lv_prod  TYPE p LENGTH 8 DECIMALS 2.
*
**Summe beider Zahlen:
*lv_summe = lv_dezi + lv_zahl.
*
**Produkt beider Zahlen:
*lv_prod = lv_dezi * lv_zahl.
*
*WRITE: 'Summe:', lv_summe, /, 'Produkt:', lv_prod.
*ULINE.
*
****** PDF Extra Übungen           *****
****** Übung 2                     *****
****** String Manipulation I       *****
*
*DATA ls_string TYPE String VALUE 'In einem Loch im Boden, da lebte ein Hobbit.'.
*REPLACE ALL OCCURRENCES OF `e` IN ls_string WITH ``.
*REPLACE ALL OCCURRENCES OF `E` IN ls_string WITH ``.      "Wichtig, Prüfung erfolgt auf Klein- und Großbuchstaben.
**cl_demo_output=>display( ls_string ).
*
****** PDF Extra Übungen           *****
****** Übung 3                     *****
****** Systemwert                  *****
*
*WRITE: 'Datum:', sy-sysid, /, 'Mandant', sy-mandt.
*ULINE.
*
****** PDF Extra Übungen           *****
****** Übung 4                     *****
****** Systemwerte II              *****
*
*WRITE: 'Die aktuelle Uhrzeit ist:', sy-uzeit.
*ULINE.
*
****** PDF Extra Übungen           *****
****** Übung 5                     *****
****** Kontrollstruktur            *****
*
*CLEAR lv_zahl.
*lv_zahl = 0.
*DO 101 TIMES.
*  IF lv_zahl MOD 3 EQ 0.
*    WRITE lv_zahl.
*  ENDIF.
*  lv_zahl = lv_zahl + 1.
*ENDDO.
*
****** PDF Extra Übungen           *****
****** Übung 6                     *****
****** Typdeklaration              *****
*
*TYPES ty_int3 TYPE int3.
*
****** PDF Extra Übungen           *****
****** Übung 7                     *****
****** Struktur                    *****
*
** - ID. Verwenden Sie den zuvor definierten Typ
**- Vorname
**- Erster Buchstabe des Nachnamens
**- Alter
**- Softskills
*
**TYPES: BEGIN OF lty_s_mita,
**          id         type ty_int3,
**          vorname    type string,
**          1nachname  type c LENGTH 1,
**          alter      type i,
**          skills     Type string,
**end of lty_s_mita.
**
**DATA gs_mita TYPE lty_s_mita.
**
**gs_mita-id = 001.
**gs_mita-vorname = 'Harry'.
**gs_mita-1nachname = 'Kane'.
**gs_mita-alter = 33.
**gs_mita-skills = 'Stürmer'.
*
** LÖSUNG COACH *
*
**DATA: BEGIN OF ls_teilnehmer,
**      id TYPE ty_interger3,
**      vorname type string,
**      nachname type c LENGTH 1,
**      alter type i,
**      softskills type string,
**      END OF LS_TEILNEHMER.
**
**  ls_teilnehmer-id = 1.
**  ls_teilnehmer-vorname = 'Heinz'.
**  ls_teilnehmer-nachname = 'B'.
**  ls_teilnehmer-alter = 61.
**  ls_teilnehmer-softskills = 'leidenschaftlicher Programmierer'.
**
**  ls_teilnehmer = VALUE #(
**    id = 1
**    vorname = 'Heinz'
**    nachname = 'B'
**    alter = 60
**    softskills = '-'
**  ).
*
****** PDF Extra Übungen           *****
****** Übung 8                     *****
****** Tabellen I und II           *****
*
*TYPES: BEGIN OF lty_s_mita,
*         id       TYPE ty_int3,
*         vorname  TYPE string,
*         nachname TYPE string,
*         alter    TYPE i,
*         skills   TYPE string,
*       END OF lty_s_mita.
*
*DATA: lt_mita TYPE TABLE OF lty_s_mita,
*      ls_mita TYPE lty_s_mita.
*
*ls_mita-id = 001.
*ls_mita-vorname = 'Harry'.
*ls_mita-nachname = 'Kane'.
*ls_mita-alter = 33.
*ls_mita-skills = 'Stürmer'.
*INSERT ls_mita INTO TABLE lt_mita.
*CLEAR ls_mita.
*
*ls_mita-id = 002.
*ls_mita-vorname = 'Manuel'.
*ls_mita-nachname = 'Neuer'.
*ls_mita-alter = 36.
*ls_mita-skills = 'TW'.
*INSERT ls_mita INTO TABLE lt_mita.
*CLEAR ls_mita.
*
*ls_mita-id = 003.
*ls_mita-vorname = 'Leroy'.
*ls_mita-nachname = 'Sane'.
*ls_mita-alter = 27.
*ls_mita-skills = 'MF'.
*INSERT ls_mita INTO TABLE lt_mita.
*CLEAR ls_mita.
*
*ls_mita-id = 004.
*ls_mita-vorname = 'Thomas'.
*ls_mita-nachname = 'Müller'.
*ls_mita-alter = 35.
*ls_mita-skills = 'Stürmer'.
*INSERT ls_mita INTO TABLE lt_mita.
*CLEAR ls_mita.
*
*ls_mita-id = 005.
*ls_mita-vorname = 'Alex'.
*ls_mita-nachname = 'Pavlovic'.
*ls_mita-alter = 33.
*ls_mita-skills = 'Stürmer'.
*INSERT ls_mita INTO TABLE lt_mita.
*CLEAR ls_mita.
*
**cl_demo_output=>display( lt_mita ).
*
****** Übung 9                     *****
****** Tabellen I und II           *****
*
*DATA: BEGIN OF ls_werte,
*        euro   TYPE p DECIMALS 2,
*        dollar TYPE p DECIMALS 2,
*      END OF ls_werte,
*      lt_werte LIKE TABLE OF ls_werte.
*
*DATA(lv_euro) = 0.
*
*CONSTANTS: lc_umrechnung TYPE p DECIMALS 2 VALUE '1.09'.
*
*PARAMETERS: p_urk TYPE p DECIMALS 2 OBLIGATORY.
*
** VARIANTE Konstante im PARAMETER festschreiben:
**INITIALIZATION.
**p_urk = lc_umrechnung.
**
**START-OF-SELECTION.
*DO 100 TIMES.
*  ls_werte-euro = ls_werte-euro + 1.
** ls_werte-dollar = ls_werte-euro * lc_umrechnung.
*  ls_werte-dollar = ls_werte-euro * p_urk.
*  append ls_werte to lt_werte.
*ENDDO.

*cl_demo_output=>display( lt_werte ).

***** PDF Extra Übungen          *****
***** Übung 11                   *****
***** Einsetzen                  *****

*Deklarieren Sie zwei Zahlen a und b und geben Sie ihnen beliebige Werte.
*Lassen Sie sich den folgenden Text ausgeben.
*Ersetzen Sie a, b und c mit den Zahlenwerten.
*c ist die Summe aus a und b. 'Die Summe aus a und b ist c.'

DATA: lv_a    TYPE p VALUE '4',
      lv_b    TYPE p VALUE '3',
      lv_sum  TYPE i.

lv_sum = lv_a + lv_b.

WRITE: 'AUFGABE: Ersetzen Sie a, b und c mit den Zahlenwerten. c ist die Summe aus a und b.'.
ULINE. ULINE.

*Variante 1:
WRITE: 'Die Summe aus', lv_a, 'und', lv_b, 'ist', lv_sum.
ULINE.
*Variante 2:
WRITE / |Die Summe aus { lv_a } und { lv_b } ist { lv_sum }|.

***** PDF Extra Übungen         *****
***** Übung 12                  *****
***** Extra: Typdeklaration II  *****

*Deklarieren Sie einen Typ. Dieser enthält zwei Spalten für Sprachkürzel und Text.
*Verwenden Sie den Typ um eine Tabelle zu deklarieren.Befüllen sie die Tabelle.
