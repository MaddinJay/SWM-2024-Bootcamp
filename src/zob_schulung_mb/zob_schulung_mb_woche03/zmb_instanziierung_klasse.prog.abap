*&---------------------------------------------------------------------*
*& Report zmb_instanziierung_klasse
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_instanziierung_klasse.

*START-OF-SELECTION.
DATA kraftfahrzeug TYPE REF TO ZMB_Kraftfahrzeug. " Declaration unserer Klasse

kraftfahrzeug = NEW #( ). " Instance unserer Klasse mit # häufiger
*kraftfahrzeug = NEW zmb_Kraftfahrzeug(). " Alternative zum Coden

*CREATE OBJECT kraftfahrzeug. * altes Coding Instance unserer Klasse

*Data(attribut) = kraftfahrzeug->hersteller. "Attribut Zuweisung

kraftfahrzeug->abbremsen( ). " Methodenaufruf 1. Variante

*Call method kraftfahrzeug->abbremsen. "Methodenaufruf 2. Variante
