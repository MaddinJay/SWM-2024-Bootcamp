*&---------------------------------------------------------------------*
*& Report zmb_extra_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_kopie_extra_uebung.

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
DATA int3 TYPE NUMC3.

int3 = '123'.
WRITE int3.
Uline.

*Extra: Struktur
*Erstellen Sie eine Struktur für Teilnehmer.
*Diese soll mindestens die folgenden Felder besitzen:
*- ID. Verwenden Sie den zuvor definierten Typ
*- Vorname
*- Erster Buchstabe des Nachnamens
*- Alter
*- Softskills
*Befüllen Sie Struktur

TYPES: BEGIN OF lty_s_teil,

         ID          TYPE numc3,
         vorname     TYPE string,
         nachname    TYPE char1,
         alter       TYPE i,
         softskills  TYPE string,


       END OF LTY_S_TEIL,
       lty_t_teiln TYPE TABLE OF lty_s_teil WITH KEY ID.

DATA gs_teil TYPE lty_s_teil.
DATA gt_teiln TYPE lty_t_teiln.

gs_teil-id =     '123'.
gs_teil-vorname     = 'Max'.
gs_teil-nachname = 'Meier'.
gs_teil-alter = '23'.
gs_teil-softskills    = 'teamfähig'.

WRITE:
'ID:', gs_teil-id, /,
'Vorname:' ,gs_teil-vorname, /,
'Nachname:',gs_teil-nachname, /,
'Alter:',gs_teil-alter, /,
'Softskills:',gs_teil-softskills.
Uline.

*Extra: Tabellen
*Erzeugen Sie aus der Teilnehmer-Struktur eine Tabelle.
*Befüllen Sie die Tabelle mit mindestens 5 Einträgen.


gs_teil-id =     '124'.
gs_teil-vorname     = 'Peter'.
gs_teil-nachname = 'Müller'.
gs_teil-alter = '22'.
gs_teil-softskills    = 'kommunikativ'.
INSERT gs_teil INTO TABLE gt_teiln.

WRITE:
'ID:', gs_teil-id, /,
'Vorname:' ,gs_teil-vorname, /,
'Nachname:',gs_teil-nachname, /,
'Alter:',gs_teil-alter, /,
'Softskills:',gs_teil-softskills.
Uline.

gs_teil-id =     '125'.
gs_teil-vorname     = 'Claudia'.
gs_teil-nachname = 'Fischer'.
gs_teil-alter = '29'.
gs_teil-softskills    = 'IT-affin'.
INSERT gs_teil INTO TABLE gt_teiln.

WRITE:
'ID:', gs_teil-id, /,
'Vorname:' ,gs_teil-vorname, /,
'Nachname:',gs_teil-nachname, /,
'Alter:',gs_teil-alter, /,
'Softskills:',gs_teil-softskills.
Uline.

gs_teil-id =     '126'.
gs_teil-vorname     = 'Katharina'.
gs_teil-nachname = 'Becker'.
gs_teil-alter = '20'.
gs_teil-softskills    = 'kommunikativ'.
INSERT gs_teil INTO TABLE gt_teiln.

WRITE:
'ID:', gs_teil-id, /,
'Vorname:' ,gs_teil-vorname, /,
'Nachname:',gs_teil-nachname, /,
'Alter:',gs_teil-alter, /,
'Softskills:',gs_teil-softskills.
Uline.

gs_teil-id =     '127'.
gs_teil-vorname     = 'Sabine'.
gs_teil-nachname = 'Meier'.
gs_teil-alter = '27'.
gs_teil-softskills    = 'motiviert'.
INSERT gs_teil INTO TABLE gt_teiln.

WRITE:
'ID:', gs_teil-id, /,
'Vorname:' ,gs_teil-vorname, /,
'Nachname:',gs_teil-nachname, /,
'Alter:',gs_teil-alter, /,
'Softskills:',gs_teil-softskills.
Uline.
