*&---------------------------------------------------------------------*
*& Report zob_report01_002_fb
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_report01_002.
************************************************************************
* Beschreibung: Testreport
************************************************************************
WRITE 'Hello World'.
ULINE.
WRITE: 'Datum:', sy-datum, /.
WRITE: 'Systemsprache:', sy-langu, /.
WRITE: 'User-Name:', sy-uname.
ULINE.
WRITE: 'Name Anwendungsserver:', sy-host, /.
WRITE: 'Name Datenbankserver:',sy-dbsys.

ULINE.

******* Daten Deklarationen: **********

*Alternative - Inline Deklaration:                          ******
DATA(lv_text) = 'Ich bin ein Text'.
DATA(lv_zahl) = 3.

******* Alternative - Elementare Felddefinition:            ******
******* Variable wird erst deklariert,danach Wertzuweisung. ******
*DATA: lv_text TYPE string.
*lv_text = |Ich bin ein Text|.
*DATA: lv_zahl TYPE int2.
*lv_zahl = 3.

****** Alternative - Elementare Felddefinition:             ******
****** Variable wird direkt mit einem Wert deklariert.      ******

*DATA: lv_text TYPE string VALUE 'Ich bin ein Text'.
*DATA: lv_zahl TYPE int2 VALUE 3.

****** Alternative - Deklaration mehrerer Daten:            ******

*DATA: lv_text TYPE string VALUE 'Ich bin ein Text',
*      lv_zahl TYPE int2 VALUE 3.

****** Ausgabe der Variablen:                               ******
*ULINE.
*WRITE: 'Variablen Deklaration:'.
*WRITE: lv_text, lv_zahl.

ULINE.

lv_text = |Hello World. { lv_text }|.
lv_zahl = lv_zahl + 6.

DATA(lv_zahl2) = '000123'.
SHIFT lv_zahl2 LEFT DELETING LEADING '0'.

*WRITE: lv_text, /, lv_zahl, /, lv_zahl2.

DATA: BEGIN OF ls_struktur,
kundennr TYPE int2,
kundenname TYPE string,
datum TYPE dats,
END OF ls_struktur,
lt_tabelle LIKE TABLE OF ls_struktur.

WRITE lv_text.
WRITE lv_zahl.
*cl_demo_output=>display( ls_struktur ).
*cl_demo_output=>display( lt_tabelle ).

ls_struktur-kundennr = 1.
ls_struktur-kundenname = 'Harry Kane'.
ls_struktur-datum = sy-datum.

*cl_demo_output=>display( ls_struktur ).

APPEND VALUE #(
kundennr = 2
kundenname = 'Jamal Musiala'
datum = sy-datum ) TO lt_tabelle.

lt_tabelle = VALUE #(  BASE lt_tabelle (  Kundenname = 'Leroy Sane' ) ).

cl_demo_output=>display( lt_tabelle ).
ULINE.

TYPES: t_favourite_color TYPE c LENGTH 10.
DATA lv_fav_color TYPE t_favourite_color VALUE 'yellow'. WRITE lv_fav_color.
ULINE.

CONSTANTS lc_hello TYPE string VALUE 'Hello World!'.
CONSTANTS lc_text TYPE string VALUE 'Ich bin ein Text'.

lv_text = |{ lc_hello } { lc_text }|.
WRITE / lv_text.
