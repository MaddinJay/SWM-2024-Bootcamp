*&---------------------------------------------------------------------*
*& Report zmb_extra_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_extra_uebung.

*Aufgabenstellung:Extra: Zahlen
*Deklarieren Sie eine Dezimal Zahl mit dem Wert 15,55.
*Deklarieren Sie einen Integer mit dem Wert 4.
*Berechnen Sie die Summe beider Zahlen.
*Berechnen Sie das Produkt (*) der beiden Zahlen.
*Lassen Sie sich alle (Zwischen-) Ergebnisse ausgeben.

Data lv_zahl TYPE p DECIMALS 2 value '15.55'.
Data lv_zahl2 type i value 4.
DATA lv_erg TYPE p DECIMALS 2.

lv_erg = lv_zahl + lv_zahl2.
write lv_erg.
lv_erg = lv_zahl * lv_zahl2.
write / lv_erg.
Uline.

*Aufgabenstellung:Extra: String Manipulation I
*Erstellen Sie einen String mit folgendem Text.
" In einem Loch im Boden, da lebte ein Hobbit."
*Entfernen Sie alle e im Text.
*Lassen Sie sich den Text ausgeben.
*Recherchieren Sie das REPLACE Pattern in ABAP.

Data lv_text type string value 'In einem Loch im Boden, da lebte ein Hobbit.'.
Replace ALL OCCURRENCES OF 'e' IN lv_text WITH ''. "Diese Anweisung ersetzt Zeichen
skip.
write / lv_text.


*Lassen Sie sich Ihr System und Ihren Mandanten ausgeben
*Extra: Systemwerte II

Uline.
Write: 'System und Mandant:', sy-sysid, sy-mandt.


*Geben Sie die aktuelle Uhrzeit im Satz aus.
*z.B. Die aktuelle Zeit ist 10:04:00 Uhr.
Uline.
write: /'Die aktuelle Zeit ist:', sy-uzeit.


*Extra: Kontrollstruktur
*Geben Sie alle Zahlen zwischen 1 und 100 aus, welche ohne Rest durch 3 teilbar
*sind.


*Data lv_zahlen type i value 1.
*do 100 times.IF lv_zahlen MOD 3 EQ 0.
*lv_zahlen = lv_zahlen + 1.
*write: /, 'durch 3 teilbar:', lv_zahlen, /.
*endif.
*ENDDO.
Uline.
DATA(lv_zaehler) = 1.
WHILE lv_zaehler <= 100.
  IF lv_zaehler MOD 3 EQ 0.

    WRITE: / , 'Dreier Zahl:', lv_zaehler.
  ENDIF.
  lv_zaehler = lv_zaehler + 1.
ENDWHILE.

*Extra: Typdeklaration  -> ab hier Lösungen vergleichen
*Deklarieren Sie einen Integertyp der Länge 3.

Uline.
types ty_integer3 Type Int1. "Typen deklarieren


*Extra: Struktur
*Erstellen Sie eine Struktur für Teilnehmer.
*Diese soll mindestens die folgenden Felder besitzen:
*- ID. Verwenden Sie den zuvor definierten Typ
*- Vorname
*- Erster Buchstabe des Nachnamens
*- Alter
*- Softskills
*Befüllen Sie Struktur

Data: BEGIN OF ls_teilnehmer,

         ID          TYPE INT1,
         vorname     TYPE string,
         nachname    TYPE char1, "oder c oder string
         alter       TYPE i,
         softskills  TYPE string,
        END OF ls_teilnehmer.

DATA: lt_teilnehmer like table of ls_teilnehmer.



ls_teilnehmer-id =     '1'.
ls_teilnehmer-vorname     = 'Max'.
ls_teilnehmer-nachname = 'Meier'.
ls_teilnehmer-alter = '23'.
ls_teilnehmer-softskills    = 'teamfähig'.
Append ls_teilnehmer to lt_teilnehmer.


*cl_demo_output=>display( ls_teilnehmer ).
Uline.

*Extra: Tabellen
*Erzeugen Sie aus der Teilnehmer-Struktur eine Tabelle.
*Befüllen Sie die Tabelle mit mindestens 5 Einträgen.


ls_teilnehmer-id =     '2'.
ls_teilnehmer-vorname     = 'Peter'.
ls_teilnehmer-nachname = 'Müller'.
ls_teilnehmer-alter = '22'.
ls_teilnehmer-softskills    = 'kommunikativ'.
Append ls_teilnehmer to lt_teilnehmer.


ls_teilnehmer-id =     '3'.
ls_teilnehmer-vorname     = 'Katharina'.
ls_teilnehmer-nachname = 'Becker'.
ls_teilnehmer-alter = '20'.
ls_teilnehmer-softskills    = 'kommunikativ'.
Append ls_teilnehmer to lt_teilnehmer.


ls_teilnehmer-id =     '4'.
ls_teilnehmer-vorname     = 'Sabine'.
ls_teilnehmer-nachname = 'Meier'.
ls_teilnehmer-alter = '27'.

ls_teilnehmer-softskills    = 'lernbereit'.
Append ls_teilnehmer to lt_teilnehmer.

cl_demo_output=>display( lt_teilnehmer ).

*Extra: Tabelle II
*Deklarieren Sie eine Tabelle mit zwei Spalten (Euro und Doller).
*Befüllen Sie die erste Spalte der Tabelle mit den Zahlen 1 -100.
*Recherchieren Sie den Umrechnungskurs von Euro zu Doller.
*Ermitteln Sie für jeden Euro Wert (jede Zeile der Tabelle) den äquivalenten
*Dollar Wert und schreiben Sie ihn in die Tabelle.
*Lassen Sie sich die Tabelle ausgeben.


Data: BEGIN OF ls_werte,
           euro     TYPE p decimals 2,
         dollar     TYPE p DECIMALS 2,
        END OF ls_werte,
 lt_werte like table of ls_werte.


 Data(lv_euro) = 0.

 Constants: lc_umrechnung Type p DECIMALS 2 Value '1.09'.

parameters p_umre type p DECIMALS 2 OBLIGATORY.

INITIALIZATION.
p_umre = lc_umrechnung.
START-OF-SELECTION.

 Do 100 TIMES.
 ls_werte-euro = ls_werte-euro + 1.
 ls_werte-dollar = ls_werte-euro * p_umre. "hier vorher ls_umrechnung, wurde durch Konstante ausgetauscht.
 append ls_werte to lt_werte.
 enddo.

 cl_demo_output=>display( lt_werte ).
