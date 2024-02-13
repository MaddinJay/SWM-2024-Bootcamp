*&---------------------------------------------------------------------*
*& Report z_uebung_extra_21112023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_extra_21112023.

*Aufgabe 1

*DATA lv_decimal TYPE p DECIMALS 2.
*DATA lv_integer TYPE i.
*DATA lv_erg TYPE p DECIMALS 2.
*DATA lv_produkt TYPE p DECIMALS 4.
*
*lv_decimal = '15.55'.
*WRITE lv_decimal.
*
*lv_integer = 4.
*WRITE / lv_integer.

*Summe
*lv_erg = lv_decimal + lv_integer.
*WRITE / lv_erg.
*
**Produkt
*lv_produkt = lv_decimal * lv_integer.
*WRITE / lv_produkt.
*
*ULINE.

*Aufgabe 2

*DATA lv_satz TYPE string.
*lv_satz = ' In einem Loch im Boden, da lebte ein Hobbit.'.
*WRITE / lv_satz.

*Ersetze alle e
*REPLACE ALL OCCURRENCES OF 'e' IN lv_satz WITH '' .
*WRITE / lv_satz.
*
*ULINE.

*Aufgabe 3

*WRITE: 'Der Mandant ist:', sy-sysid, /, 'Die aktuelle Uhrzeit ist', sy-timlo,'.'.
*
*ULINE.

*Aufgabe 4 Kontrollstruktur
*Geben Sie alle Zahlen zwischen 1 und 100 aus, welche ohne Rest durch 3 teilbar sind.

*DATA: lv_zahl TYPE i VALUE 1.
*
*WHILE lv_zahl <= 100.
*  IF lv_zahl MOD 3 EQ 0.
*    WRITE: lv_zahl.
*  ENDIF.
*  lv_zahl = lv_zahl + 1.
*ENDWHILE.

*Aufgabe 5
*Deklarieren Sie einen Integertyp der Länge 3.

*TYPES l_integertyp TYPE int1.
*
**Aufgabe 6 und 7
**Erstellen Sie eine Struktur für Teilnehmer
**Erzeugen Sie aus der Teilnehmer-Struktur eine Tabelle.
**Befüllen Sie die Tabelle mit mindestens 5 Einträgen.
*
*DATA: BEGIN OF ls_teilnehmer,
*        id         TYPE l_integertyp,
*        Vorname    TYPE string,
*        Nachname   TYPE c,
*        alter      TYPE i,
*        softskills TYPE string,
*      END OF ls_teilnehmer.
*
*DATA lt_teilnehmer LIKE TABLE OF ls_teilnehmer.
*
*ls_teilnehmer-id = 001.
*ls_teilnehmer-vorname = 'Marlene'.
*ls_teilnehmer-nachname = 'K'.
*ls_teilnehmer-alter = 34.
*ls_teilnehmer-softskills = 'Kommunikation'.
*APPEND ls_teilnehmer to lt_teilnehmer.
*
*ls_teilnehmer-id = 002.
*ls_teilnehmer-vorname = 'Charlotte'.
*ls_teilnehmer-nachname = 'M'.
*ls_teilnehmer-alter = 54.
*ls_teilnehmer-softskills = 'Erklärbär'.
*APPEND ls_teilnehmer to lt_teilnehmer.
*
*
*ls_teilnehmer-id = 003.
*ls_teilnehmer-vorname = 'Phillipp'.
*ls_teilnehmer-nachname = 'Z'.
*ls_teilnehmer-alter = 27.
*ls_teilnehmer-softskills = 'Konfliktlösung'.
*APPEND ls_teilnehmer to lt_teilnehmer.
*
*ls_teilnehmer-id = 004.
*ls_teilnehmer-vorname = 'Georg'.
*ls_teilnehmer-nachname = 'B'.
*ls_teilnehmer-alter = 48.
*ls_teilnehmer-softskills = 'Medienkompetenz'.
*APPEND ls_teilnehmer to lt_teilnehmer.
*
*ls_teilnehmer-id = 005.
*ls_teilnehmer-vorname = 'Harry'.
*ls_teilnehmer-nachname = 'R'.
*ls_teilnehmer-alter = 37.
*ls_teilnehmer-softskills = 'Strukturiertes und zielorientiertes Arbeiten'.
*APPEND ls_teilnehmer to lt_teilnehmer.
*
*
*LOOP AT lt_teilnehmer ASSIGNING FIELD-SYMBOL(<fs_tabellenzeile>).
*WRITE: / <fs_tabellenzeile>-id, <fs_tabellenzeile>-vorname, <fs_tabellenzeile>-nachname, <fs_tabellenzeile>-alter,  <fs_tabellenzeile>-softskills.
*ENDLOOP.
*
*cl_demo_output=>display(
*  data = lt_teilnehmer ).
*  ULINE.

*Aufgabe 7 Umrechnungstabelle

*Deklarieren Sie eine Tabelle mit zwei Spalten (Euro und Doller).
*Befüllen Sie die erste Spalte der Tabelle mit den Zahlen 1 -100.
*Recherchieren Sie den Umrechnungskurs von Euro zu Doller.
*Ermitteln Sie für jeden Euro Wert (jede Zeile der Tabelle) den äquivalenten
*Dollar Wert und schreiben Sie ihn in die Tabelle.
*Lassen Sie sich die Tabelle ausgeben.

*DATA: BEGIN OF ls_umrechnungstabelle,
*      Euro type p DECIMALS 2,
*      Dollar type p DECIMALS 2,
*      END of ls_umrechnungstabelle.
*
*DATA lv_euro type i VALUE 1.
*
*PARAMETERS P_Wech Type p DECIMALS 2.
*DAta lt_umrechnungstabelle like table of ls_umrechnungstabelle.
*
*DO 100 times.
*ls_umrechnungstabelle-euro = lv_euro.
*ls_umrechnungstabelle-dollar = ls_umrechnungstabelle-euro * p_wech.
*lv_euro = lv_euro + 1.
*APPEND ls_umrechnungstabelle to lt_umrechnungstabelle.
*ENDDO.
*
*Loop at lt_umrechnungstabelle assigning field-SYMBOL(<fs_tabellenzeile1>).
*ENDLOOP.
*cl_demo_output=>display( lt_umrechnungstabelle ).

*Aufgabe 8 Einsetzen
*Deklarieren Sie zwei Zahlen a und b und geben Sie ihnen beliebige Werte.
*Lassen Sie sich den folgenden Text ausgeben. Ersetzen Sie a, b und c mit den
*Zahlenwerten. c ist die Summe aus a und b.
*'Die Summe aus a und b ist c.'

PARAMETERS: P_a TYPE i,
            P_b TYPE i.
DATA c TYPE i.

INITIALIZATION.
  MESSAGE 'Ersetzen Sie a und b mit Zahlenwerten. Die Summe aus a und b ist c' TYPE 'I'.

START-OF-SELECTION.
  c = p_a + p_b.
  WRITE: 'Die Summe aus',p_a,'+',p_b,'=',c.


*Aufgabe 9
*Deklarieren Sie einen Typ.
*Dieser enthält zwei Spalten für Sprachkürzel und Text.
*Verwenden Sie den Typ um eine Tabelle zu deklarieren.
*Befüllen Sie die Tabelle.

  TYPES: lty_Sprachkurzel TYPE c LENGTH 10,
         lty_Text         TYPE string.

  DATA: BEGIN OF ls_Sprache,
          Sprachkurzel TYPE lty_Sprachkurzel,
          Text         TYPE lty_Text,
        END OF ls_Sprache.

  DATA lt_Sprache LIKE TABLE OF ls_Sprache.

  ls_sprache-sprachkurzel = 'bspw.'.
  ls_sprache-text = 'beispielsweise'.
  APPEND ls_Sprache TO lt_sprache.

  ls_sprache-sprachkurzel = 'd.h.'.
  ls_sprache-text = 'das heißt'.
  APPEND ls_Sprache TO lt_sprache.

  ls_sprache-sprachkurzel = 'mMn'.
  ls_sprache-text = 'meiner Meinung nach'.
  APPEND ls_Sprache TO lt_sprache.

  LOOP AT lt_sprache ASSIGNING FIELD-SYMBOL(<fs_tabellenzeile2>).
    WRITE: / <fs_tabellenzeile2>-sprachkurzel, <fs_tabellenzeile2>-text.
  ENDLOOP.

  cl_demo_output=>display(
    data = lt_sprache ).
