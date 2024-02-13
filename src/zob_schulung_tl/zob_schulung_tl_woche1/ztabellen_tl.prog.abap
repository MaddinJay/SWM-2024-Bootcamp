*&---------------------------------------------------------------------*
*& Report ztabellen_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztabellen_tl.
"Aufgabe: Leere Tabelle erstellt und befüllt:
DATA: lv_text TYPE string VALUE 'Ich bin ein Text',
      lv_zahl TYPE i VALUE 3.
"WRITE: /, lv_text, lv_zahl.
ULINE.

DATA: BEGIN OF ls_struktur,
        kundennr   TYPE int2,
        kundenname TYPE string,
        datum      TYPE dats,
      END OF ls_struktur,
      lt_tabelle LIKE TABLE OF ls_struktur.

"WRITE lv_text.
"WRITE lv_zahl.
"cl_demo_output=>display( ls_struktur ).
"cl_demo_output=>display( lt_tabelle ).

ls_struktur-kundennr = 1.
ls_struktur-kundenname = 'Tobias Bachmeier'.
ls_struktur-datum = sy-datum.

APPEND ls_struktur TO lt_tabelle.

"Beispiel 1 wie mann Sachen in Tabelle befüllen kann
APPEND VALUE #(
kundennr = 2
kundenname = 'Jonas Schuster'
datum = sy-datum
) TO lt_tabelle.

"Beispiel 2 wie mann Sachen in Tabelle befüllen kann, hier wird zb nur kundenname befüllt, weil nur das da steht.
lt_tabelle = VALUE #( BASE lt_tabelle ( kundenname = 'Sebastian Müller') ).

cl_demo_output=>display(
data = lt_tabelle ).

LOOP AT lt_tabelle INTO ls_struktur.
WRITE: ls_struktur-kundennr, /, ls_struktur-kundenname, /, ls_struktur-datum.
ENDLOOP.
*"Aufgabe: Deklarieren Sie einen neuen Typ. Deklarieren Sie eine neue Variable mit diesem Typ.
*TYPES: t_favourite_color TYPE c LENGTH 10.
*DATA lv_fav_color TYPE t_favourite_color VALUE 'yellow'.
*WRITE lv_fav_color.
*ULINE.
*"Aufgabe: Die Zahlen 1 bis 10 ausgeben lassen und mit einer Verzweigung ungerade und gerade Zahlen ausgeben:
*DATA(lv_zaehler) = 1.
*WHILE lv_zaehler <= 10.
*WRITE lv_zaehler.
*lv_zaehler = lv_zaehler + 1.
*ENDWHILE.
*
*IF lv_zaehler MOD 2 EQ 0.
*WRITE 'even'. ELSE.
*WRITE 'odd'.
*ENDIF.

CONSTANTS lc_hello TYPE string VALUE 'Hello World!'.
CONSTANTS lc_text TYPE string VALUE 'Ich bin ein Text'.
lv_text = |{ lc_hello } { lc_text }|.
