*&---------------------------------------------------------------------*
*& Report zfb_instanziierung_klasse
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_instanziierung_klasse.

DATA lt_kfz TYPE REF TO zfb_kraftfahrzeug.

lt_kfz = new zfb_kraftfahrzeug( ).                "Instanz unserer Klasse.

"CREATE OBJECT lt_kfz.

*DATA(attribut) = lt_kfz->hersteller.              "Attribut Zuweisung

lt_kfz->beschleunigen(  ).                         "Methodenaufruf 1. Variante

*CALL METHOD lt_kfz->abbremsen.                    "Methodenaufruf 2. Variante
