*&---------------------------------------------------------------------*
*& Report zuh_uebung_23_11_2023_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_uebung_23_11_2023_2.

*******************************************************
* Typdeklaration II
*******************************************************
*Deklarieren Sie einen Typ.
*Dieser enthält zwei Spalten für Sprachkürzel und Text.
*Verwenden Sie den Typ um eine Tabelle zu deklarieren.
*Befüllen Sie die Tabelle

TYPES: BEGIN OF lys_data,
         kuerzel TYPE c LENGTH 2,
         text    TYPE string,
       END OF lys_data.
DATA     lt_data TYPE TABLE OF lys_data.

lt_data = VALUE #(
( kuerzel = 'DE' text = 'deutscher Text' )
( kuerzel = 'IT' text = 'italien Text' )
( kuerzel = 'EN' text = 'englischer Text' )
( kuerzel = 'FR' text = 'französischer Text' )
( kuerzel = 'BE' text = 'belgischer Text' )
).



cl_demo_output=>display( lt_data ).
