*&---------------------------------------------------------------------*
*& Report ztw_instanziierung_klasse
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_instanziierung_klasse.

DATA kraftfahrzeug TYPE REF TO ztw_kraftfahrzeug. "Deklaration unserer Klasse

kraftfahrzeug = NEW #(  ). "Instanz unserer Klasse / # steht für Abkürzung = ztw_kraftfahrzeug

kraftfahrzeug->abbremsen(  ).
