*&---------------------------------------------------------------------*
*& Report zaw_uebung_json
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_json.


*** Wandeln Sie JSON-Daten in eine interne Tabelle um.

*TYPES: BEGIN OF ts_json,        "Struktur für interne Tabelle aufbauen
*         key   TYPE string,
*         value TYPE string,
*       END OF ts_json.
*DATA:  ls_jsondata TYPE ts_json.
*
*DATA(lv_jsondata) = '{ "key": "1", "value": "One" }'.   "Ersatz, weil keine JSON-Datei aus Internet hochgeladen wurde (anlag dem Aufbau des JSON-Formats)
*
*/ui2/cl_json=>deserialize(
*  EXPORTING json = CONV #( lv_jsondata )
*  CHANGING data = ls_jsondata
*).
*
*cl_demo_output=>display( ls_jsondata ).

DATA(ls_jsondata2) = '{ "animals" :[{ "type": "cat", "name": "Tishka", "age": 5, "loves": "sausage", "breed": "red cat" }, { "type": "dog", "name": "Tuzik", "age": 5, "breed": "Ovcharka", "hobby": "throw a ball" } ]}'.

TYPES:
  BEGIN OF ts_animal_characteristics,
    type  TYPE string,
    name  TYPE string,
    age   TYPE string,
    loves TYPE string,
    breed TYPE string,
  END OF ts_animal_characteristics,
  tt_animals TYPE STANDARD TABLE OF ts_animal_characteristics.

DATA: BEGIN OF ls_animals,
        animals TYPE tt_animals,
      END OF ls_animals.

/ui2/cl_json=>deserialize(
  EXPORTING json = CONV #( ls_jsondata2 )
  CHANGING data = ls_animals
).

cl_demo_output=>display( ls_animals-animals ).
WRITE ''.
