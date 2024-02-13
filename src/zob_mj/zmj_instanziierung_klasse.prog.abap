*&---------------------------------------------------------------------*
*& Report zmj_instanziierung_klasse
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmj_instanziierung_klasse.


*START-OF-SELECTION.
DATA kraftfahrzeug TYPE REF TO zmj_kraftfahrzeug. "Declaration unserer Klasse

kraftfahrzeug = NEW zmj_kraftfahrzeug( ). " Instance unserer Klasse

*CREATE OBJECT kraftfahrzeug.

*DATA(attribut) = kraftfahrzeug->hersteller. " Attribut Zuweisung

kraftfahrzeug->beschleunigen( ).  " Methodenaufruf - 1. Variante

*call METHOD kraftfahrzeug->abbremsen. " Methodenaufruf - 2. Variante
