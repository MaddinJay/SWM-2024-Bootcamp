*&---------------------------------------------------------------------*
*& Report z_instanziierung_klasse_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_instanziierung_klasse_tl.

*START-OF-SELECTION. "Bei Programmablauf braucht man START-OF-SELECTION
  DATA kraftfahrzeug TYPE REF TO z_abap_oo_kraftfahrzeuge_tl. "Wir haben unsere Klasse deklariert

  kraftfahrzeug = NEW #(  ). "Instance unserer Klasse, Hashtag ist Abkürzung, damit ich den Klassennamen nicht nochmal schreiben muss.

*  CREATE OBJECT kraftfahrzeug.

*  DATA(attribut) = kraftfahrzeug->hersteller. "Attribut aufrufen
  kraftfahrzeug->abbremsen(  ). "Methode aufrufen 1 Variante

* call METHOD kraftfahrzeug->abbremsen.  "Alte Methode um METHOD aufzurufen 2 Variante
