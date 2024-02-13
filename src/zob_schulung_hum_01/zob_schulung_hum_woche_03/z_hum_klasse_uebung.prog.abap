*&---------------------------------------------------------------------*
*& Report z_hum_klasse_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_klasse_uebung.

DATA kraftfahrzeug TYPE REF TO z_hum_kraftfahrzeug. "Deklaration unserer Klasse

kraftfahrzeug = NEW #(  ). "Instanz unserer Klasse, statt # könnte man auch den Namen der Klasse ausschreiben; # ist vorteilhafter und gängiger

*CREATE OBJECT kraftfahrzeug. "Alternative, ältere Schreibweise

DATA(attribut) = kraftfahrzeug->hersteller.  " Attribut
kraftfahrzeug->abbremsen( ).                 " Methode
CALL METHOD kraftfahrzeug->beschleunigen.    " Alternative, ältere Schreibweise
