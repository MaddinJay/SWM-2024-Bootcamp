*&---------------------------------------------------------------------*
*& Report zem_wasserglas
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_wasserglas.

Start-of-SELECTION.

Data lo_glas type ref to zem_class_wasserglas.

"Instanziierung

lo_glas = NEW #( ).                 "Objekt erstellen
lo_glas->fuellen( iv_fuellen = 5 ). "Methode aufrufen
lo_glas->leeren( iv_leeren = 3 ).
lo_glas->get_fuellmenge( ).

Data lo_gesamtmenge type i.

lo_gesamtmenge = lo_glas->get_fuellmenge(  ).

Write: 'Restmenge:', lo_gesamtmenge.

End-of-SELECTION.
