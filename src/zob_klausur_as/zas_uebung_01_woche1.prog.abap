*&---------------------------------------------------------------------*
*& Report zas_uebung_01_woche1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_uebung_01_woche1.

*Erstellen Sie einen String mit folgendem Text.
*" In einem Loch im Boden, da lebte ein Hobbit."
*Entfernen Sie alle e im Text. Lassen Sie sich den Text ausgeben.

*DATA lv_text TYPE string VALUE 'In einem Loch im Boden, da lebte ein Hobbit.'.
*
*REPLACE ALL OCCURRENCES OF 'e' IN lv_text WITH ''.
*WRITE lv_text.

"Lassen Sie sich Ihr System und Ihren Mandanten ausgeben
*WRITE: sy-sysid, sy-mandt.

"Geben Sie die aktuelle Uhrzeit im Satz aus.
"z.B. Die aktuelle Zeit ist 10:04:00 Uhr.
*WRITE: |Die aktuelle Zeit ist { sy-uzeit } .|.

"Geben Sie alle Zahlen zwischen 1 und 100 aus, welche ohne Rest durch 3 teilbar sind.
*DATA lv_zahl TYPE i VALUE 1.
*
*WHILE lv_zahl <= 100.
*  IF lv_zahl MOD 3 EQ 0.
*    WRITE: lv_zahl, /.
*  ENDIF.
*  lv_zahl = lv_zahl + 1.
*ENDWHILE.

"Deklarieren Sie einen Integertyp der Länge 3.
*DATA lv_int type int1.

"Erstellen Sie eine Struktur für Teilnehmer.
"Diese soll mindestens die folgenden Felder besitzen: - ID.
"Verwenden Sie den zuvor definierten Typ
"- Vorname
"- Erster Buchstabe des Nachnamens
"- Alter
"- Softskills
"Befüllen Sie Struktur
*TYPES: BEGIN OF lsty_teilnehmer,
*         vorname    TYPE string,
*         nachname   TYPE c,
*         alter      TYPE i,
*         softskills TYPE string,
*       END OF lsty_teilnehmer.
*
*DATA gs_teilnehmer TYPE lsty_teilnehmer.
*
*gs_teilnehmer-vorname = 'Ahmet'.
*WRITE gs_teilnehmer-vorname.

"Erzeugen Sie aus der Teilnehmer-Struktur eine Tabelle.
"Befüllen Sie die Tabelle mit mindestens 5 Einträgen.
*DATA gt_teilnehmer type table of lsty_teilnehmer.

*Deklarieren Sie eine Tabelle mit zwei Spalten (Euro und Dollar).
*Befüllen Sie die erste Spalte der Tabelle mit den Zahlen 1 -100.
*Recherchieren Sie den Umrechnungskurs von Euro zu Dollar.
*Ermitteln Sie für jeden Euro Wert (jede Zeile der Tabelle) den äquivalenten Dollar Wert und schreiben Sie ihn in die Tabelle.
*Lassen Sie sich die Tabelle ausgeben.
*TYPES: BEGIN OF ls_kurs,
*         euro   TYPE p,
*         dollar TYPE p DECIMALS 2,
*       END OF ls_kurs.
*
*DATA gs_kurs TYPE ls_kurs.
*DATA gt_kurs TYPE TABLE OF ls_kurs.
*PARAMETERS p_dk TYPE p DECIMALS 2.
*
*WHILE gs_kurs-euro <= 100.
**  gs_kurs-dollar = '1.09'.
*  gs_kurs-euro = gs_kurs-euro + 1.
*  gs_kurs-dollar = gs_kurs-euro * p_dk.
*  APPEND gs_kurs TO gt_kurs.
*  WRITE: / gs_kurs-euro, gs_kurs-dollar.
*ENDWHILE.

*Deklarieren Sie zwei Zahlen a und b und geben Sie ihnen beliebige Werte.
*Lassen Sie sich den folgenden Text ausgeben.
*Ersetzen Sie a, b und c mit den Zahlenwerten. c ist die Summe aus a und b.
*'Die Summe aus a und b ist c.'
*ULINE.
*DATA: lv_a TYPE i VALUE 2,
*      lv_b TYPE i VALUE 3,
*      lv_c TYPE i.
*
*lv_c = lv_a + lv_b.
*
*write |Die Summe aus { lv_a } und { lv_b } ist { lv_c }|.
**WRITE: 'Die Summe aus', lv_a, 'und', lv_b,  'ist', lv_c.

**********************************************************************
* Extra: Typdeklaration
**********************************************************************

*Deklarieren Sie einen Typ.
*Dieser enthält zwei Spalten für Sprachkürzel und Text.
*Verwenden Sie den Typ um eine Tabelle zu deklarieren.
*Befüllen Sie die Tabelle.

*TYPES: BEGIN OF lty_beispiel,
*         sprachkuerzel TYPE c LENGTH 2,
*         text          TYPE string,
*       END OF lty_beispiel.
*
**DATA gty_beispiel TYPE lty_beispiel.
*DATA gt_beispiel TYPE TABLE OF lty_beispiel.
*
**gty_beispiel-sprachkuerzel = 'DE'.
**gty_beispiel-text = 'Beispieltext'.
**APPEND gty_beispiel TO gt_beispiel.
*
*gt_beispiel = VALUE #(
*( sprachkuerzel = 'DE' text = 'deutscher Text' )
*( sprachkuerzel = 'TR' text = 'türkischer Text' )
*).
*
*cl_demo_output=>display( gt_beispiel ).
**WRITE: / gt_beispiel-sprachkuerzel, gt_beispiel-text.


**********************************************************************
* Komplexe Tabelle
**********************************************************************

*Deklarieren Sie einen Strukturtyp mit den Feldern.
*- Sprache
*- Farbenname
*Erstellen Sie eine Tabelle zu Farben.
*Die Tabelle soll mindestens die folgenden Spalten besitzen:
*- Name der Farbe
*- Vorkommen in der Natur
*- Emotion die mit der Farbe assoziiert ist
*- Übersetzung der Farbe in andere Sprachen. Nutzen Sie den zuvor deklarierten Tabellentyp.
*Befüllen Sie die Tabelle und geben Sie aus.
*Bedenken Sie das Sie keine tiefen Strukturen anzeigen können.
*
*TYPES: BEGIN OF ls_farbenstruktur,
*        sprache    TYPE string,
*        farbenname TYPE string,
*        vorkommen type string,
*        emotionen type string,
*        uebersetzung type string,
*      END OF ls_farbenstruktur.
*
*DATA gs_farbenstruktur TYPE ls_farbenstruktur.
*DATA gt_farbenstruktur TYPE TABLE OF ls_farbenstruktur.
*
*
*gs_farbenstruktur-farbenname = 'Blau'.
*gs_farbenstruktur-sprache = 'deutsch'.
*gs_farbenstruktur-vorkommen = 'Meer'.
*gs_farbenstruktur-emotionen = 'positiv'.
*gs_farbenstruktur-uebersetzung = 'Blau'.

"Rest siehe Maureens OneNote
