*&---------------------------------------------------------------------*
*& Report z_report01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_report01.

**********************************************************************
* Extra: ZAHLEN
**********************************************************************

*Deklarieren Sie eine Dezimal Zahl mit dem Wert 15,55.
CONSTANTS lv_decimals TYPE p DECIMALS 2 VALUE '15.55'.
WRITE: 'Das ist die Kommazahl', lv_decimals.

*Deklarieren Sie einen Integer mit dem Wert 4.
CONSTANTS lv_integer TYPE i VALUE 4.

*Berechnen Sie die Summe beider Zahlen.
DATA lv_summe TYPE p DECIMALS 2.
lv_summe = lv_decimals + lv_integer.
WRITE: 'Das ist die Summe: ', lv_summe.

*Berechnen Sie das Produkt (*) der beiden Zahlen.
lv_summe = lv_decimals * lv_integer.
WRITE: 'Das ist das Produkt: ', lv_summe.
ULINE.

*Lassen Sie sich alle (Zwischen-) Ergebnisse ausgeben.

**********************************************************************
* Extra: String Manipulation I
**********************************************************************
*Erstellen Sie einen String mit folgendem Text.
*" In einem Loch im Boden, da lebte ein Hobbit."
*Entfernen Sie alle e im Text. Lassen Sie sich den Text ausgeben.

DATA(lv_text) = 'In einem Loch im Boden, da lebtE ein Hobbit.'.
REPLACE ALL OCCURRENCES OF 'e' IN lv_text WITH ''.
WRITE lv_text.

**********************************************************************
* Extra: Systemwert
**********************************************************************

*Lassen Sie sich Ihr System und Ihren Mandanten ausgeben.
ULINE.
WRITE: / sy-sysid, sy-mandt.

**********************************************************************
* Extra: Systemwerte II
**********************************************************************

* Geben Sie die aktuelle Uhrzeit im Satz aus. z.B. Die aktuelle Zeit ist 10:04:00 Uhr.
WRITE: / 'Die aktuelle Zeit ist', sy-uzeit, 'Uhr'.

**********************************************************************
* Extra: Kontrollstruktur
**********************************************************************

* Geben Sie alle Zahlen zwischen 1 und 100 aus, welche ohne Rest durch 3 teilbar sind.
ULINE.
DATA lv_zahl TYPE i VALUE 0.
WHILE lv_zahl <= 100.
  IF lv_zahl MOD 3 EQ 0.
    WRITE lv_zahl.
  ENDIF.
  lv_zahl = lv_zahl + 1.
ENDWHILE.

**********************************************************************
* Extra: Typdeklaration
**********************************************************************

* Deklarieren Sie einen Integertyp der Länge 3.
ULINE.
TYPES ty_integer TYPE int1.

**********************************************************************
* Extra: Struktur
**********************************************************************

*Erstellen Sie eine Struktur für Teilnehmer.
*Diese soll mindestens die folgenden Felder besitzen: - ID.
*Verwenden Sie den zuvor definierten Typ - Vorname - Erster Buchstabe des Nachnamens - Alter - Softskills
*Befüllen Sie Struktur.
* Erzeugen Sie aus der Teilnehmer-Struktur eine Tabelle. Befüllen Sie die Tabelle mit mindestens 5 Einträgen.

TYPES: BEGIN OF ls_teilnehmer,
         id              TYPE ty_integer,
         vorname         TYPE string,
         ersterBuchstabe TYPE c,
         alter           TYPE n,
         softskills      TYPE string,
       END OF ls_teilnehmer.

DATA gs_teilnehmer TYPE ls_teilnehmer.
DATA gt_teilnehmer TYPE TABLE OF ls_teilnehmer.

gs_teilnehmer-id = 1.
gs_teilnehmer-vorname = 'Max'.
gs_teilnehmer-ersterbuchstabe = 'M'.
gs_teilnehmer-alter = '25'.
gs_teilnehmer-softskills = 'Kommunikation'.
APPEND gs_teilnehmer TO gt_teilnehmer.

gs_teilnehmer-id = 2.
gs_teilnehmer-vorname = 'Mike'.
gs_teilnehmer-ersterbuchstabe = 'M'.
gs_teilnehmer-alter = '35'.
gs_teilnehmer-softskills = 'Teamfähigkeit'.
APPEND gs_teilnehmer TO gt_teilnehmer.

gs_teilnehmer-id = 3.
gs_teilnehmer-vorname = 'Moritz'.
gs_teilnehmer-ersterbuchstabe = 'M'.
gs_teilnehmer-alter = '76'.
gs_teilnehmer-softskills = 'Belastbarkeit'.
APPEND gs_teilnehmer TO gt_teilnehmer.

"Alternative
gs_teilnehmer = VALUE #(
id = 4
vorname = 'ALex'
ersterbuchstabe = 'C'
alter = 45
softskills = 'Reflektion'
).
APPEND gs_teilnehmer TO gt_teilnehmer.

WRITE: / gs_teilnehmer-id, gs_teilnehmer-vorname, gs_teilnehmer-ersterbuchstabe, gs_teilnehmer-alter, gs_teilnehmer-softskills.

**********************************************************************
* Tabellen2
**********************************************************************

*Deklarieren Sie eine Tabelle mit zwei Spalten (Euro und Doller).
*Befüllen Sie die erste Spalte der Tabelle mit den Zahlen 1 -100.
*Recherchieren Sie den Umrechnungskurs von Euro zu Doller.
*Ermitteln Sie für jeden Euro Wert (jede Zeile der Tabelle) den äquivalenten Dollar Wert und schreiben Sie ihn in die Tabelle.
*Lassen Sie sich die Tabelle ausgeben.

TYPES: BEGIN OF ls_kurs,
         euro   TYPE p,
         dollar TYPE p DECIMALS 2,
       END OF ls_kurs.

DATA gs_kurs TYPE ls_kurs.
DATA gt_kurs TYPE TABLE OF ls_kurs.
PARAMETERS p_dk TYPE p DECIMALS 2.

WHILE gs_kurs-euro <= 100.
*  gs_kurs-dollar = '1.09'.
  gs_kurs-euro = gs_kurs-euro + 1.
  gs_kurs-dollar = gs_kurs-euro * p_dk.
  APPEND gs_kurs TO gt_kurs.
  WRITE: / gs_kurs-euro, gs_kurs-dollar.
ENDWHILE.

**********************************************************************
* Extra: Einsetzen
**********************************************************************

*Deklarieren Sie zwei Zahlen a und b und geben Sie ihnen beliebige Werte.
*Lassen Sie sich den folgenden Text ausgeben.
*Ersetzen Sie a, b und c mit den Zahlenwerten. c ist die Summe aus a und b.
*'Die Summe aus a und b ist c.'
ULINE.
data: lv_a type i value 2,
      lv_b type i value 3,
      lv_c type i.

lv_c = lv_a + lv_b.
write: 'Die Summe aus', lv_a, 'und', lv_b,  'ist', lv_c.
