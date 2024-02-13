*&---------------------------------------------------------------------*
*& Report zob_hum_exerc_hello_world
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_hum_exerc_hello_world.

DATA lv_result TYPE string.                              "Deklaration der Variablen result
DATA(lo_hello_world) = NEW zcl_hum_exerc_hello_world( ). "Deklaration und Methode erzeugen

lv_result = lo_hello_world->hello(  ).                   "Methode abrufen.

WRITE lv_result.                                          "Ausgabe der Variable lv_result.
