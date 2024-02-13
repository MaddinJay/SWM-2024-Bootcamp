*&---------------------------------------------------------------------*
*& Report zea_instanzierung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zea_instanzierung.


*START OF SELECTION.
DATA kraftfahrzeug TYPE REF TO zea_klassen_kraftfahrzeug. "Declaration unserer klasse

kraftfahrzeug = NEW #(  ). "Instance unserer klasse

*CREATE OBJECT kraftfahrzeug.

*DATA(attribute) = kraftfahrzeug->hersteller.   "Attribute  Zuweisung
*                  kraftfahrzeug->abbremsen( ).
*
*CALL METHOD kraftfahrzeug->abbremsen. "Metodenaufruf 1. Variante

kraftfahrzeug->abbremsen( ).          "Methodenaufruf 2. Variante
