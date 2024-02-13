*&---------------------------------------------------------------------*
*& Report zaw_wiederholung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_wiederholung.

*Datendeklaration

DATA lv_data TYPE i VALUE 3.

"Variable ausgeben

WRITE lv_data.

"Datenmanipulation

lv_data = lv_data + 2.

"Konstanten

CONSTANTS lc_wert TYPE string VALUE 'test'.

"Typdeklaration

TYPES: ty_wert(6) TYPE c,
       ty_wert2   TYPE c LENGTH 2.

"Struktur deklarieren

DATA: BEGIN OF ls_struktur,
        id    TYPE i,
        name  TYPE string,
        alter TYPE i,
      END OF ls_struktur.

"Struktur befüllen

ls_struktur = VALUE #(
 id = 7
 name = 'Max'
 alter = 9
  ).
ls_struktur = VALUE #( BASE ls_struktur name = 'Maria' ). "Bei BASE wird nur der mitgegebene Wert geändert, der Rest bleibt so bestehen.
