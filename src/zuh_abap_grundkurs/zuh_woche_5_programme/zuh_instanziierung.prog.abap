*&---------------------------------------------------------------------*
*& Report zuh_instanziierung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_instanziierung.

DATA Kraftfahrzeug TYPE REF TO  zuh_kraftfahrzeug.  "Declaration unserer Klasse

* Create OBJECT kraftfahrzeug.       "Instance unserer Klasse ...alt
* oder kraftfahrzeug = NEW zuh_kraftfahrzeug( ).          "Instance unserer Klasse
kraftfahrzeug = NEW #( ).          "Instance unserer Klasse


* DATA(attribut) = kraftfahrzeug->hersteller.   "  Attributzuweisung

* CALL METHOD kraftfahrzeug->abbremsen.     "aufruf der Methode ... alt
Kraftfahrzeug->abbremsen( ).              "aufruf der Methode
CALL METHOD kraftfahrzeug->starten( ).
kraftfahrzeug->beschleunigen( ).
