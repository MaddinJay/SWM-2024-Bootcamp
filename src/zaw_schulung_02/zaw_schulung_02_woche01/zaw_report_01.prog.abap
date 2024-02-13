*&---------------------------------------------------------------------*
*& Report zaw_report_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
***********************************************************
*Weiland:2023-11-20
***********************************************************
REPORT zaw_report_01.

*WRITE 'Hello World'. "Das ist eine Textausgabe!
*ULINE.

*DATA(ls_test) = 'Test'. "Inlinedeklaration
*WRITE ls_test.

*DATA ls_eclipse TYPE string VALUE 'Vordefiniert'.
*DATA ls_zahl TYPE i VALUE 9.
*
** vordefinierter Wert wird überschrieben
*ls_eclipse = 'Text'.
*ls_zahl = 45000.
*
*WRITE: / ls_eclipse , ls_zahl.
*
*ULINE.
*
*WRITE: / 'Tagesdatum: ',  sy-datum.
*WRITE: / 'Sprache: ', sy-langu.
*WRITE: / 'Anwendungsserver: ' , sy-host.
*WRITE: / 'Systemserver: ' , sy-dbsys.

**********************************************************************
*** Strings zusammenfügen

*DATA ls_hello TYPE string.
*DATA ls_text TYPE string.
*DATA ls_zusammen TYPE string.
*
*ls_hello = 'Hello World!'.
*ls_text = 'Ich bin ein Text.'.
*
*CONCATENATE: ls_hello ls_text INTO ls_zusammen SEPARATED BY ''.
*
*WRITE ls_zusammen.
*
***********************************************************************
*** Addition
*
*DATA ls_zahl TYPE i VALUE 8.
*DATA ls_erg TYPE i.
*
*ls_erg = ls_zahl + 9.
*WRITE: / 'Ergebnis: ', ls_erg.

**********************************************************************

*DATA: BEGIN OF ls_struktur, "Anfang des Strukturtyps
*        kundennr   TYPE int2,
*        kundenname TYPE string,
*        datum      TYPE dats,
*        zeit       TYPE t,
*      END OF ls_struktur, "Ende des Strukturtyps
*      lt_table LIKE TABLE OF ls_struktur. "Definition des Tabellentyps (t) mit dem Strukturtyp (s)
*
*ls_struktur-kundennr = 1.
*ls_struktur-kundenname = 'Max Mustermann'.
*ls_struktur-datum = sy-datum.
*ls_struktur-zeit = sy-timlo.
*
*APPEND ls_struktur TO lt_table. "Strukturdaten in Tabelle einfügen.
*
*APPEND VALUE #( kundennr = 2 kundenname = 'Maria Musterfrau' datum = sy-datum zeit = sy-timlo ) TO lt_table.
*APPEND VALUE #( kundennr = 3 kundenname = 'Micky Mouse' ) TO lt_table.
*
*cl_demo_output=>display(
*data = lt_table
*).

**********************************************************************
***Typdefinition

*TYPES: t_eigenertyp TYPE c LENGTH 5
*DATA ls_evariable TYPE t_eigenertyp VALUE 'Type'.
*WRITE / ls_evariable.

**********************************************************************
*Geben Sie alle Zahlen zwischen 1 und 100 aus, welche ohne Rest durch 3 teilbar sind

*DATA ls_zahl TYPE i VALUE 1.
*
*WHILE ls_zahl <= 100.
*  IF ls_zahl MOD 3 EQ 0.
*    WRITE ls_zahl.
*  ENDIF.
*  ls_zahl = ls_zahl + 1.
*ENDWHILE.

**********************************************************************

*** Deklarieren Sie einen Integertyp der Länge 3 (über Strg. Leertaste und dann Wertehilfebeschreibung).
TYPES tt_int3 TYPE int1.

*** Erstellen Sie eine Struktur für Teilnehmer.
DATA: BEGIN OF ls_teilnehmer,
        id             TYPE tt_int3,
        Vorname(30)    TYPE c,
        1BNachname     TYPE c,
        Alter          TYPE i,
        Softskills(30) TYPE c,
      END OF ls_teilnehmer.


*** Erzeugen Sie aus der Teilnehmer-Struktur eine Tabelle. Befüllen Sie die Tabelle mit mindestens 5 Einträgen.
DATA: lt_teilnehmer LIKE TABLE OF ls_teilnehmer.

ls_teilnehmer-id = 001.
ls_teilnehmer-Vorname = 'Max'.
ls_teilnehmer-1bnachname = 'M'.
ls_teilnehmer-Alter = '24'.
ls_teilnehmer-Softskills = 'Kommunikation'.
APPEND ls_teilnehmer TO lt_teilnehmer.
CLEAR ls_teilnehmer.

* modernere Schreibweise
ls_teilnehmer = VALUE #(
id = 002
Vorname = 'Marie'
1bnachname = 'W'
Alter = '26'
Softskills = 'Fachwissen').
APPEND ls_teilnehmer TO lt_teilnehmer.
CLEAR ls_teilnehmer.

ls_teilnehmer = VALUE #(
id = 003
Vorname = 'Leo'
1bnachname = 'Z'
Alter = '27'
Softskills = 'Englisch').
APPEND ls_teilnehmer TO lt_teilnehmer.
CLEAR ls_teilnehmer.

ls_teilnehmer = VALUE #(
id = 004
Vorname = 'Larissa'
1bnachname = 'W'
Alter = '26'
Softskills = 'Französisch').
APPEND ls_teilnehmer TO lt_teilnehmer.
CLEAR ls_teilnehmer.

ls_teilnehmer = VALUE #(
id = 005
Vorname = 'Fritz'
1bnachname = 'Z'
Alter = '26'
Softskills = 'Fachwissen').
APPEND ls_teilnehmer TO lt_teilnehmer.
CLEAR ls_teilnehmer.

LOOP AT lt_teilnehmer ASSIGNING FIELD-SYMBOL(<fs_tabellenzeile>).
  WRITE: / <fs_tabellenzeile>-id, <fs_tabellenzeile>-Vorname, <fs_tabellenzeile>-1bnachname, <fs_tabellenzeile>-Alter, <fs_tabellenzeile>-Softskills.
ENDLOOP.
