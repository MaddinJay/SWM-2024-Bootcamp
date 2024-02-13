
*&---------------------------------------------------------------------*
*& Report zbl_instanziierung_klasse
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_instanziierung_klasse.

DATA kraftfahrzeug TYPE REF TO zbl_kraftfahrzeug. "Deklaration unserer Klasse

kraftfahrzeug = NEW #( ). "Instanz unserer Klasse.
*CREATE OBJECT kraftfahrzeug.

DATA(attribut) = kraftfahrzeug->hersteller. "Attribut Zuweisung

kraftfahrzeug->abbremsen( ). "Methodenaufruf Variante 1

call METHOD kraftfahrzeug->abbremsen. "Methodenaufruf variante 2
