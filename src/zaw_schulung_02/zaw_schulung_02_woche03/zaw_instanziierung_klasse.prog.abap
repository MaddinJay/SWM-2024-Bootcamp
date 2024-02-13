*&---------------------------------------------------------------------*
*& Report zaw_instanziierung_klasse
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_instanziierung_klasse.


DATA kraftfahrzeug TYPE REF TO zaw_kraftfahrzeug. "Deklaration der Klasse

kraftfahrzeug = NEW zaw_kraftfahrzeug( ). "Instanz der Klasse

data(attribut) = kraftfahrzeug->hersteller. " Attributzuweisung

kraftfahrzeug->abbremsen( ). "Methodenaufruf - 1. Variante

*call method kraftfahrzeug->abbremsen. "Methodenaufruf - 2. Variante
