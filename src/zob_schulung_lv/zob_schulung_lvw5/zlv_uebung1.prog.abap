*&---------------------------------------------------------------------*
*& Report zlv_uebung1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlv_uebung1.
"datendeklaration
DATA lv_zahl TYPE i.

"datenmanipulation
lv_zahl = lv_zahl + 1.

"constanten
CONSTANTS c_konstante TYPE string VALUE 'test'.

"typendeklaration
TYPES: ty_wert(6)  TYPE c,
       ty_wert2(2) TYPE c,
       ty_wert3    TYPE c LENGTH 3,
       ty_wert4    TYPE c LENGTH 4.

"struktur deklarieren
DATA: BEGIN OF ls_familie,
        name TYPE string,
        id   TYPE i,
        bday TYPE date,
      END OF ls_familie.

"struktur befüllen
ls_familie-name = 'ben'.
ls_familie-id = 1.
ls_familie-bday = 20012001.
ls_familie = VALUE #( name = 'paul' id = 2 bday = 123456 ).

*cl_demo_output=>display( ls_familie ).

DATA: BEGIN OF ls_haus,
        art   TYPE string,
        alter TYPE i,
      END OF ls_haus.

ls_haus = VALUE #( art = 'penthouse' alter = 2 ).

CLEAR ls_haus.

ls_haus = VALUE #( art = 'bungalow' alter = 10 ).

CLEAR ls_haus.

ls_haus-art = 'strandhaus'.
ls_haus-alter = 11.

*cl_demo_output=>display( ls_haus ).

DATA: lt_tabelle LIKE TABLE OF ls_haus.
APPEND ls_haus TO lt_tabelle.
*cl_demo_output=>display( lt_tabelle ).

data: begin of ls_familie2,
      name type string,
      id type id,
      bday type date,
      end of ls_familie2.

DATA: lt_tabelle2 LIKE TABLE OF ls_familie.
*data: lt_tabelle2 like table of ls_familie2.
INSERT ls_familie INTO lt_tabelle2 INDEX 1.
INSERT ls_familie INTO lt_tabelle2 INDEX 2.
lt_tabelle2 = value #( BASE LT_tabelle2
                        ( id = 6 name = 'klaus' bday = 06011997 )
                        ( id = 76 name = 'Peer' bday = 06451797 )
                        ( id = 32 name = 'tom' bday = 12345 ) ).
APPEND VALUE #( id = 5 name = 'hans' bday = 123456 ) TO lt_tabelle2.
*insert ls_familie2 into lt_tabelle2 index 6.
*cl_demo_output=>display( lt_tabelle2 ).



*"datendeklaration
*DATA lv_zahl TYPE i VALUE 3.
*
*"datenmanipulation
*lv_zahl = lv_zahl + 8.
*
*"konstanten
*CONSTANTS c_wert TYPE string VALUE 'test'.
*
*"typendeklaration
*TYPES: ty_wert(6) TYPE c,
*       ty_wert2   TYPE c LENGTH 2.
*
*"struktur deklarieren
*DATA: BEGIN OF ls_kunde,
*        name  TYPE string,
*        id    TYPE i,
*        alter TYPE i,
*      END OF ls_kunde.
*
*DATA: BEGIN OF ls_auto,
*        name TYPE string,
*        id   TYPE i,
*        km   TYPE i,
*      END OF ls_auto.
*
*"struktur befüllen
*ls_kunde-id = 5.
*ls_kunde-name = 'paul'.
*ls_kunde-alter = 13.
**cl_demo_output=>display( ls_kunde ).
*ls_kunde = VALUE #( id = 7 ).
*ls_kunde = VALUE #( alter = 15 ).
*ls_kunde-alter = 16.
*ls_kunde-id = 3.
*ls_kunde-name = 'tom'.
*cl_demo_output=>display( ls_kunde ).
*
*ls_auto-id = 10.
*ls_auto-name = 'toyota'.
*ls_auto = VALUE #( km = 100 ).
*ls_auto-km = 200.
*ls_auto = VALUE #( name = 'vw' ).
*ls_auto-id = 11.
*ls_auto-name = 'opel'.
*ls_auto-km = 300.
*ls_auto = VALUE #( name = 'bmw' ).
*ls_auto = VALUE #( km = 599 name = 'volvo' id = 14 ).
*cl_demo_output=>display( ls_auto ).
*
**tabelle deklarieren
*DATA: lt_tabelle LIKE TABLE OF ls_kunde.
*
*"tabelle befüllen
*APPEND ls_kunde TO lt_tabelle.
*APPEND VALUE #( id = 5 ) TO lt_tabelle.
*APPEND VALUE #( name = 'paul' ) TO lt_tabelle.
*
*APPEND ls_auto TO lt_tabelle.
*INSERT ls_auto INTO lt_tabelle INDEX 2.
*INSERT ls_kunde INTO lt_tabelle INDEX 1.
*cl_demo_output=>display( lt_tabelle ).

"aussehen: einfach eingabefeld.
PARAMETERS p_test type string.
