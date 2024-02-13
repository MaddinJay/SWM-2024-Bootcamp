*&---------------------------------------------------------------------*
*& Report zbv_instanziierung_klasse
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_instanziierung_klasse.

*Start-OF-SELECTION.
DATA kraftfahrzeug TYPE REF TO zbv_kraftfahrzeug. "Declaration unserer Klasse

kraftfahrzeug = NEW #( ). "Instance unserer Klasse

*CREATE OBJECT kraftfahrzeug.

*DATA(attribut) = kraftfahrzeug->hersteller.

kraftfahrzeug->beschleunigen( ). "Methodenaufruf - 1. Variante. Klammern signalisieren, dass es eine Methode ist.

*CALL METHOD kraftfahrzeug->abbremsen. "Methodenaufruf - 2. Variante
