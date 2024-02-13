*&---------------------------------------------------------------------*
*& Report zob_schulung_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_schulung_test.
**********************************************************************
*Write Befehl
**********************************************************************
*20.11.2023
*Write 'Hallo Welt'. "Hallo Welt Ausgabe

*cl_demo_output=>display( 'Hallo Welt' ).

*write sy-datum. "Ausgabe Datum
write sy-langu. "Ausgabe der Sprache
Write / sy-dbsys.


data lv_text type string value 'Hallo Welt.'.
NEW-LINE.
data lv_text2 type string value'Ich bin ein Text'.

lv_text = lv_text && lv_text2.

write lv_text.

data(lv_welt) ='Hallo Welt.'.
data(lv_welt2) ='Ich bin ein Text'.
lv_welt = lv_welt && 'Ich bin ein Text'.

write lv_welt.



data lv_zahl type i value 3.
lv_zahl = lv_zahl + 2.

write lv_zahl.


DATA: BEGIN OF ls_struktur,
 kundennr TYPE int2,
 kundenname TYPE string,
 datum TYPE dats,
 END OF ls_struktur,
 lt_tabelle LIKE TABLE OF ls_struktur.


ls_struktur-kundennr = 1.
ls_struktur-kundenname = 'Max Mustermann'.
ls_struktur-datum = sy-datum.
APPEND ls_struktur TO lt_tabelle.

ls_struktur-kundennr = 2.
ls_struktur-kundenname = 'Klaus Dieter'.
ls_struktur-datum = sy-datum.
APPEND ls_struktur TO lt_tabelle.

ls_struktur-kundennr = 3.
ls_struktur-kundenname = 'Claudia Fischer'.
ls_struktur-datum = sy-datum.
APPEND ls_struktur TO lt_tabelle.

Append VALUE #( kundennr = 4  ) to lt_tabelle.

lt_tabelle = Value #( Base lt_tabelle ( kundenname = 'Klaus Dieter') ).

*WRITE lv_text.
*WRITE lv_zahl.
*write ls_struktur-kundenname." es wird der Name aus der Struktur angegeben
*cl_demo_output=>display( ls_struktur ).
*cl_demo_output=>display( lt_tabelle ).


TYPES: t_favourite_color TYPE c LENGTH 3.
DATA lv_fav_color TYPE t_favourite_color VALUE 'yellow'.
DAtA lv_fav_color2 TYPE t_favourite_color VALUE 'red'.
WRITE: lv_fav_color, lv_fav_color2.
