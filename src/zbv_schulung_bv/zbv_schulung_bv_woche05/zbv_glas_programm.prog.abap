*&---------------------------------------------------------------------*
*& Report zbv_glas_programm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_glas_programm.

START-OF-SELECTION.

  DATA go_glas TYPE REF TO zbv_glas.
*  DATA go_Glas TYPE REF TO zif_bv_gefaess. "TYPE vom Interface zif_bv_gefaess übernehmen geht nur wenn Interface in der Klasse ganz oben ist
  DATA go_wasser TYPE REF TO zbv_wassser.
  DATA go_gin TYPE REF TO zbv_gin.

"Loope über diese Tabelle und rufe die Methoden fuellen, leeren und get_fuellmenge nacheinander auf
  DATA gt_getraenk TYPE TABLE OF REF TO zbv_getraenk.
*DATA gv_gesamtmenge TYPE int1. "Extra Variable für Ergebnis deklarieren.

  go_wasser = NEW #( ).
  APPEND go_wasser TO gt_getraenk.
  go_gin = NEW #( ).
  APPEND go_gin TO gt_getraenk.
*  go_glas = NEW #( go_wasser ).                 "Objekt erstellen / Instanziierung
*
*  go_glas->fuellen( iv_fuellen = 10 ). "Methode aufrufen
*  go_glas->leeren( iv_leeren = 3 ).
*
*  DATA(gv_gesamtmenge) = go_glas->get_fuellmenge(  ). "Der Variable die Werte von der Methode geben.
*
*  WRITE: /'Die Gesamtfüllmenge beträgt: ', gv_gesamtmenge.
*  ULINE.

LOOP AT gt_getraenk into DATA(go_getraenk). "In dem Loop werden die Methoden aufgerufen und so braucht man nicht mehrere Zeilen für den Methodenaufruf, sondern man appendet die Klassen in die Tabelle und loopt.
  go_glas = NEW zbv_glas( go_getraenk ). "Klasse Glas anstatt #, da bei Deklaration das Interface verwendet wurde
  go_glas->fuellen( iv_fuellen = 10 ). "Methode aufrufen
  go_glas->leeren( iv_leeren = 3 ).
  DATA(gv_gesamtmenge) = go_glas->get_fuellmenge(  ).
  WRITE: /'Die Gesamtfüllmenge beträgt: ', gv_gesamtmenge. "Ja, Write funktioniert auch in einem Loop
  ULINE.
ENDLOOP.
**********************************************************************
*  go_gin = NEW #( ).
*  APPEND go_gin TO gt_getraenk.
*  go_glas = NEW #( go_gin ).                 "Objekt erstellen / Instanziierung
*
*  go_glas->fuellen( iv_fuellen = 10 ). "Methode aufrufen
*  go_glas->leeren( iv_leeren = 3 ).
*
*  DATA(gv_gesamtmenge2) = go_glas->get_fuellmenge(  ). "Der Variable die Werte von der Methode geben.
*
*  WRITE: /'Die Gesamtfüllmenge beträgt: ', gv_gesamtmenge2.
*  ULINE.
