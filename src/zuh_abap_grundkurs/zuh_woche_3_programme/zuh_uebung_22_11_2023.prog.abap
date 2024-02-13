*&---------------------------------------------------------------------*
*& Report zuh_uebung_22_11_2023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_uebung_22_11_2023.

*******************************************************
*  Typdeklaration
*******************************************************
*Deklarieren Sie einen Integertyp der Länge 3.

TYPES lv_number TYPE int1.

ULINE.
*******************************************************
*Struktur
*******************************************************
*Erstellen Sie eine Struktur für Teilnehmer.
*Diese soll mindestens die folgenden Felder besitzen:
*- ID. Verwenden Sie den zuvor definierten Typ
*- Vorname
*- Erster Buchstabe des Nachnamens
*- Alter
*- Softskills
*Befüllen Sie Struktur.

DATA: BEGIN OF ls_struktur,
        id        TYPE int1,
        vorname   TYPE string,
        Nachname  TYPE c,
        alter     TYPE i,
        softskill TYPE string,
      END OF ls_struktur.

ls_struktur-id = 1.
ls_struktur-vorname = 'Peter'.
ls_struktur-nachname = 'Müller'.
ls_struktur-alter = 45.
ls_struktur-softskill = 'dynamisch'.

cl_demo_output=>display( ls_struktur ).

*******************************************************
*Tabelle
*******************************************************
*Erzeugen Sie aus der Teilnehmer-Struktur eine Tabelle.
*Befüllen Sie die Tabelle mit mindestens 5 Einträgen.

DATA lt_tabelle LIKE TABLE OF ls_struktur.
APPEND ls_struktur TO lt_tabelle.

ls_struktur-id = 2.
ls_struktur-vorname = 'Uli'.
ls_struktur-nachname = 'Hofmann'.
ls_struktur-alter = 55.
ls_struktur-softskill = 'lustig'.
APPEND ls_struktur TO lt_tabelle.

ls_struktur-id = 3.
ls_struktur-vorname = 'Karl'.
ls_struktur-nachname = 'Maier'.
ls_struktur-alter = 33.
ls_struktur-softskill = 'langweilig'.
APPEND ls_struktur TO lt_tabelle.

ls_struktur-id = 4.
ls_struktur-vorname = 'Ute'.
ls_struktur-nachname = 'Salva'.
ls_struktur-alter = 18.
ls_struktur-softskill = 'traurig'.
APPEND ls_struktur TO lt_tabelle.

ls_struktur-id = 5.
ls_struktur-vorname = 'Petra'.
ls_struktur-nachname = 'Ötinger'.
ls_struktur-alter = 23.
ls_struktur-softskill = 'fleisig'.
APPEND ls_struktur TO lt_tabelle.

cl_demo_output=>display( lt_tabelle ).
ULINE.
