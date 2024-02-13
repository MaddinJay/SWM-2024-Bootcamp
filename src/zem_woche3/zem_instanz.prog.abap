*&---------------------------------------------------------------------*
*& Report zem_instanz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_instanz.

*DATA lv_kraftfahrzeug TYPE REF TO zem_class_kraftfahrzeug.
*
*lv_kraftfahrzeug = NEW #(  ).  " Instanz unserer Klasse erzeugen
*
*
**CREATE OBJECT lv_kraftfahrzeug. "andere alte Schreibweise
*
*
*lv_kraftfahrzeug->abbremsen(  ).
*
*
*
**Data(attribut) = lv_kraftfahrzeug->hersteller. "Attribut Zuweisung
**call Method lv_kraftfahrzeug->abbremsen.  "andere alte Schreibweise

CLASS lcl_vehicle DEFINITION.   "Klasse erstellen
PUBLIC SECTION.                       " Öffentlicher Bereich
METHODS start_engine.             "METHODE für den öffentlichen Bereich bestimmen
ENDCLASS.

CLASS lcl_vehicle IMPLEMENTATION.
METHOD start_engine.                               "Methode implementieren
WRITE:/ 'Motor gestartet'.                            "Befehl zur Ausgabe des Textes
ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
Data lv_vehicle type ref to lcl_vehicle.

CREATE OBJECT lv_vehicle.

Call method lv_vehicle->start_engine.
