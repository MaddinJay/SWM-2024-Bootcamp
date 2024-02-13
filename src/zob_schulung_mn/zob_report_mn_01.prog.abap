*&---------------------------------------------------------------------*
*& Report zob_report_mn_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_mn_01.
**********************************************************************
* Beschreibung: Testreport
**********************************************************************
* Ertellt MNOAH 20.11.2024
**********************************************************************
* Änderungen
**********************************************************************
* 20.11.2023
**********************************************************************
*WRITE 'HELLO WORLD'.
* " gibt das Datum aus
*WRITE / sy-datum.
*WRITE sy-langu. " Ausgabe der Sprache
*WRITE / sy-host.
*WRITE / sy-dbsys.

CONSTANTS: lc_text type string VALUE 'Ich bin ein Text',
      lc_zahl TYPE i value 1234.

WRITE: lc_text, lc_zahl.

*
*lv_text = 'Hello World. ' && lv_text.
*
*lv_zahl = lv_zahl + 8.
*
*DATA(lv_zahl2) = '000123'.
*lv_zahl2 = |{ lv_zahl2  ALPHA = OUT }|.
*
*WRITE lv_zahl2.
DATA: BEGIN OF ls_struktur,
        kundennr   TYPE int2,
        kundenname TYPE string,
        datum      TYPE dats VALUE '20220115',
      END OF ls_struktur,
      lt_tabelle LIKE TABLE OF ls_struktur.

ls_struktur-kundennr = 1.
ls_struktur-kundenname  = 'Tobias Bachmeier'.
ls_struktur-datum = sy-datum.

APPEND ls_struktur TO lt_tabelle.

APPEND VALUE #( kundennr = 7 kundenname = 'Karl Meyer' ) TO lt_tabelle.

lt_tabelle = VALUE #( BASE lt_tabelle ( kundenname = 'Sebastian Müller') ).
*
*cl_demo_output=>display(
*  data    = lt_tabelle
*).

TYPES: BEGIN OF st_favourite_color,
         favorite_color TYPE c LENGTH 5,
         code           TYPE c LENGTH 1,
       END OF st_favourite_color.

**DATA(ls_fav_color) = VALUE st_favourite_color( favorite_color = 'red' code ='R' ).
**
*cl_demo_output=>display( ls_fav_color ).
"do
"while
*LOOP AT lt_tabelle ASSIGNING FIELD-SYMBOL(<ls_tabellenzeile>).
LOOP AT lt_tabelle INTO ls_struktur.
*  WRITE / <ls_tabellenzeile>-kundenname.
  WRITE / ls_struktur-kundenname.
ENDLOOP.
DATA(lv_zahl3) = 8.
ADD 1 TO lv_zahl3.
WRITE lv_zahl3.
