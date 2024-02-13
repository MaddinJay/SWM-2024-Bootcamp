*&---------------------------------------------------------------------*
*& Report zem_report2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_report2.

* DATA gv_v1 TYPE i VALUE 2.
* Data gv_v2 type i value 3.
* data gv_v3 type i.           "Deklaration einer Variable in der das Ergebnis aus gv_v und gv_v2 ausgegegben werden soll
*
* gv_v3 = gv_v1 ** gv_v2.        "Berechnung: V Hoch V1 = Ergebnis
*
* WRITE: gv_v3, /.                "Ausgabe des Ergebnisses (Potenz)"
*
**WRIte:  'Hello Word', /.       "Textausgabe

 "cl_demo_output=>display( 'Hello Word' ).

* skip 2.


*Write  sy-datum.             "Auslesen aktuelles Datum
* write / sy-langu.             "Auslesen Sprache
* Write / sy-dbsys.            "Auslesen  Datenbankservers
*
* DATA(lv_v) = 'hallo'.
*
* Write / lv_v.
*
* DATA(lv_v3) = '3.9'.
*
* Data lv_v4 TYPE p DECIMALS 2.
*
* lv_v4 = lv_v3 / 2.
*
* Write lv_v4.


*Data(lv_text) = 'Ich bin ein Text'.
*Data(lv_zahl) = 3.

Data lv_text type string value '  ich bin ein Text '.
Data lv_text2 type string value 'Hallo World '.
*Data lv_text3 type string.
*
*Data lv_zahl type i value 3.
*Data lv_zahl2 type string value '00023'.
*
*SHIFT lv_zahl2 LEFT DELETING LEADING '0'. "führende Nuller löschen
*
*Write: lv_zahl2, /.
*lv_text = lv_text2 && lv_text.
*
if 'das' CO 'albern'.
Write 'richtig'.
Else. Write 'falsch'.
Endif.
Write: /, lv_text.
NEW-LINE.
Write:  /, lv_text2.

Data: BEgin of ls_struktur,                      "deklarierung einer struktur....
      Interpret type string,
      Instrument type string,
      Genre type string,
      wirkjahr type d,
      End of ls_struktur.

 Data lt_tabelle like table of ls_struktur.     "lokale Tabelle mit deklarierter Struktur.

ls_struktur-interpret = 'Miles Davis'.
ls_struktur-instrument = 'Horn'.
ls_struktur-genre = 'Jazz'.
ls_struktur-wirkjahr = '19560101'.
Append ls_struktur to lt_tabelle.


ls_struktur-interpret = 'John Coltrane'.
ls_struktur-instrument = 'Sax'.
ls_struktur-genre = 'Jazz'.
ls_struktur-wirkjahr = '19590101'.
Append ls_struktur to lt_tabelle.


ls_struktur-interpret = 'Thelonious Monk'.
ls_struktur-instrument = 'Piano'.
ls_struktur-genre = 'Jazz'.
ls_struktur-wirkjahr = '19490101'.
Append ls_struktur to lt_tabelle.

APPEND value #( instrument = 'jj' ) to lt_tabelle. "Datensatz an eine Tabelle am Ende hinzufügen

Types: t_album type c length 12.

Data lv_album type t_album value 'Monks Dream'.

WRITE / lv_album.


*cl_demo_output=>display( ls_struktur ).
*cl_demo_output=>display( lt_tabelle ).

Uline.

Loop at lt_tabelle into ls_struktur.
Write: /,'Interpret:', ls_struktur-interpret, /.
Write: 'Instrument:', ls_struktur-instrument, /.
endloop.

*Loop at lt_tabelle assigning field-symbol(<ls_struktur>).
*Write / ls_struktur-interpret.
*Endloop.

*Data lv_zahl type i value 1.
*
*While lv_zahl < 10.
*Write / lv_zahl.
*
*IF lv_zahl MOD 2 EQ 0.
*    Write 'even'.
*    Else. Write 'odd'.
*  Endif.
*
*lv_zahl = lv_zahl + 1.
*Endwhile.
*Uline.
**Do 10 Times.
**
**Write / lv_zahl.
***cl_demo_output=>display( lv_zahl ).
**lv_Zahl = lv_zahl + 1.
**
**  IF lv_zahl MOD 2 EQ 0.
**    Write 'even'.
**    Else. Write 'odd'.
**  Endif.
**
**Enddo.
*
*
*Constants lv_constant type p DECIMALS 2 value '2.4'.
*
*Constants: Begin of ls_constant,
*           Saga type n value 3,
*           Sagb type p decimals 2 value '2.4',
*End of ls_constant.
*
*Data lt_constant like table of ls_constant.
*
*cl_demo_output=>display( ls_constant ).
*
*Write: ls_constant-saga, ls_constant-sagb.
