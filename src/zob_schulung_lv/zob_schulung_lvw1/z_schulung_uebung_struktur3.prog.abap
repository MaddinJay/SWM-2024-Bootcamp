*&---------------------------------------------------------------------*
*& Report ZOB_TEST_DW
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_test_dw.

**********************************************************************
* Wiederholung Woche 1

"Datendeklaration
"Elementarer Typ deklarieren
DATA lv_zahl TYPE i VALUE 3.

"Variable ausgeben
*WRITE lv_zahl.
*cl_demo_output=>display( lv_zahl ).

"Datenmainpulation
lv_zahl = lv_zahl + 8 .

"Systemwerte
*WRITE sy-uname.

"Konstanten
CONSTANTS c_wert TYPE string VALUE 'Test'.

"Typdeklaration
TYPES: ty_wert(6) TYPE c,
       ty_wert2   TYPE c LENGTH 6.


"Struktur deklarieren
DATA: BEGIN OF ls_kunde,
        id    TYPE i,
        name  TYPE string,
        alter TYPE i,
      END OF ls_kunde.

"Struktur befüllen
ls_kunde-id = 5.
ls_kunde-name = 'Test'.
*cl_demo_output=>display( ls_kunde ).
ls_kunde = VALUE #( id = 7 ).
ls_kunde = VALUE #( BASE ls_kunde  name = 'Testi' ).
ls_kunde-alter = 12.
ls_kunde = VALUE #( id = 20 ).
*cl_demo_output=>display( ls_kunde ).

"Tabelle deklarieren
DATA: lt_tabelle LIKE TABLE OF ls_kunde.
"Tabelle befüllen
APPEND ls_kunde TO lt_tabelle.
append value #( id = 5 ) to lt_tabelle.
INSERT ls_kunde INTO lt_tabelle INDEX 1.
lt_tabelle = VALUE #( BASE lt_tabelle
                  ( id = 8  name = 'Name 1' alter = 12 )
                  ( id = 12 name = 'Name 2' alter = 7 )
                  ).

"Schleife
"Verzweigung
