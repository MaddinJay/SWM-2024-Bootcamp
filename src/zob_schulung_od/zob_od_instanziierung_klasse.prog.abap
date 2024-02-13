*&---------------------------------------------------------------------*
*& Report zob_od_instanziierung_klasse
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_instanziierung_klasse.
DATA kraftfahrzeug TYPE REF TO zod_kraftfahrzeug. " Deklaration unserer Klasse

kraftfahrzeug = NEW #(  ). "Instance unserer Klasse
*kraftfahrzeug = NEW zod_kraftfahrzeug(  ). "Instance unserer Klass

DATA(attribut) = kraftfahrzeug->hersteller. "Attribut Zuweisung
kraftfahrzeug->abbremsen( ). "Methodenaufruf Variante 1
kraftfahrzeug->beschleunigen( ). "Methodenaufruf Variante 1

*call METHOD kraftfahrzeug->abbremsen.
