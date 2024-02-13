*&---------------------------------------------------------------------*
*& Report zem_getraenk_programm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_getraenk_programm.

START-OF-SELECTION.

**********************************************************************
* Aufruf statischer Methode in Klassen (Getränk,Wasser+Gin) mit Beschreibungen für die Berechnung.

Call Method: zem_class_getraenk=>beschreibung,    "allgemeine Beschreibung
             zem_class_wasser=>wasser,           "nur für Wasser
             zem_class_gin=>gin.                "nur für Gin

**********************************************************************
*Definition von objekten mit referenz zu den klassen glas wasser gin

  DATA go_glas TYPE REF TO ZEM_CLASS_glas.
  DATA go_wasser TYPE REF TO ZEM_CLASS_wasser.
  DATA go_gin TYPE REF TO ZEM_CLASS_gin.


**********************************************************************
*Aufruf von Instanz-Methoden in Klassen (wasser und gin). Werte werden der Tabelle gt_getränk angehangen


Data gt_getraenk type table of ref to zem_class_getraenk.

go_wasser = NEW #( ).             "Instanzierung Wasser
Append go_wasser to gt_getraenk.  "Eintrag in Tabelle gt_getränk

Go_gin = NEW #(  ).               "das gleiche für Gin
Append go_gin to gt_getraenk.

* Ausgabe erfolgt über einen Loop über dei Tabelle gt_getränk.... Importparameter sind für beide Getränke im glas die gleichen
Loop at gt_getraenk into Data(go_getraenk).

  go_glas = NEW zem_class_glas( go_getraenk ).    "Instanzierung Überklasse Glas. Mit Klassenname statt #, weil Interface verwendet wurde.
  go_glas->zem_interface_getraenk~fuellen( iv_fuellen = 10 ). "Methode aufrufen
  go_glas->zem_interface_getraenk~leeren( iv_leeren = 3 ).

  DATA(gv_gesamtmenge) = go_glas->zem_interface_getraenk~get_fuellmenge(  ). "Der Variable die Werte von der Methode geben.

  Write: /'Die Gesamtfüllmenge beträgt: ', gv_gesamtmenge, /.

  Endloop.

*  go_wasser = NEW #( ).
*
*  go_glas = NEW #( go_wasser ).                 "Objekt erstellen / Instanziierung
*
*  go_glas->zem_interface_getraenk~fuellen( iv_fuellen = 10 ). "Methode aufrufen
*  go_glas->zem_interface_getraenk~leeren( iv_leeren = 3 ).
*
*  DATA(gv_gesamtmenge) = go_glas->zem_interface_getraenk~get_fuellmenge(  ). "Der Variable die Werte von der Methode geben.
*
*  WRITE: /'Die Gesamtfüllmenge beträgt: ', gv_gesamtmenge.
*  ULINE.
********************************************************************
*  go_gin = NEW #( ).
*
*  go_glas = NEW #( go_gin ).                 "Objekt erstellen / Instanziierung
*
*  go_glas->zem_interface_getraenk~fuellen( iv_fuellen = 10 ). "Methode aufrufen
*  go_glas->zem_interface_getraenk~leeren( iv_leeren = 3 ).
*
*  DATA(gv_gesamtmenge2) = go_glas->zem_interface_getraenk~get_fuellmenge(  ). "Der Variable die Werte von der Methode geben.
*
*
* WRITE: /'Die Gesamtfüllmenge beträgt: ', gv_gesamtmenge2.
*  ULINE.
