*&---------------------------------------------------------------------*
*& Report z_as_oo
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_oo.

DATA lv_kraftfahrzeug TYPE REF TO z_as_kraftfahrzeug. "Deklaration unserer Klasse

lv_kraftfahrzeug = NEW #(  ). "Instanz unserer Klasse, # = Klassenname wird nicht mehr benötigt

*DATA(attribut) = lv_kraftfahrzeug->hersteller. "Attribut zuweisen

lv_kraftfahrzeug->abbremsen( ). "Methode aufrufen 1. Variante

*call method lv_kraftfahrzeug->abbremsen( ). Methode aufrufen 2. Variante (alt)
*CREATE OBJECT lv_kraftfahrzeug.
