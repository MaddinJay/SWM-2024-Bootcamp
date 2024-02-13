*&---------------------------------------------------------------------*
*& Report zob_report_glas
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_glas.
DATA lo_glas TYPE REF TO zea_glas. "Instanzierung
DATA gesamtmenge TYPE i.
DATA go_getraenk TYPE REF TO ZEA_Wasser.

go_getraenk = NEW #( ).
lo_glas = NEW #( go_getraenk ).                 "Objekt erstellen
lo_glas->ZIF_EA_GEFAESS~fuellen( iv_fuellen = 20 ). "Methode aufrufen
lo_glas->ZIF_EA_GEFAESS~leeren( iv_leeren = 3 ).
gesamtmenge = lo_glas->ZIF_EA_GEFAESS~get_fuellmenge( ). "oben deklarierte variable nun hier zum Ausgeben

WRITE: / 'die Gesamtmenge beträgt:', gesamtmenge.
ULINE.
