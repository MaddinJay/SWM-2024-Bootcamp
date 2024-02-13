*&---------------------------------------------------------------------*
*& Report ztl_glas_program
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_glas_program.

START-OF-SELECTION.

  DATA go_glas TYPE REF TO zif_gefaess_tl.
  DATA go_wasser TYPE REF TO zcl_tl_wasser.
  DATA go_gin TYPE REF TO zcl_tl_gin.

  DATA go_getraenk TYPE REF TO zcl_tl_getraenk.

*DATA gv_gesamtmenge TYPE int1. "Extra Variable für Ergebnis deklarieren.
**********************************************************************
  "Aufgabe Vererbung 4
  "Füge die erzeugten Instanzen der Klassen Wasser und Gin in eine Tabelle von Typ-Referenzen der Oberklasse Getränk ein
  DATA gt_getraenk TYPE TABLE OF REF TO zcl_tl_getraenk.

  go_wasser = NEW #( ).
  APPEND go_wasser TO gt_getraenk.

  go_gin = NEW #( ).
  APPEND go_gin TO gt_getraenk.

  "Loope über diese Tabelle und rufe die Methoden fuellen, leeren und get_fuellmenge nacheinander auf
  LOOP AT gt_getraenk INTO go_getraenk.
    go_glas = NEW zcl_tl_glas( go_getraenk ).
    go_glas->fuellen( iv_fuellen = 10 ). "Methode aufrufen
    go_glas->leeren( iv_leeren = 3 ).

    DATA(gv_gesamtmenge) = go_glas->get_fuellmenge(  ). "Der Variable die Werte von der Methode geben.

    CASE go_getraenk.
      WHEN go_wasser.
        WRITE: / |Die Gesamtfüllmenge Wasser beträgt: { gv_gesamtmenge } dl|.
      WHEN go_gin.
        WRITE: / |Die Gesamtfüllmenge Gin beträgt: { gv_gesamtmenge } dl|.
    ENDCASE.

    "    WRITE: /'Die Gesamtfüllmenge beträgt: ', gv_gesamtmenge.
    ULINE.
  ENDLOOP.

**********************************************************************
  "Altes Code von vorherigen Übungen bis Übung 4 Vererbung:
*  go_glas = NEW #( go_wasser ).                 "Objekt erstellen / Instanziierung
*
*  go_glas->fuellen( iv_fuellen = 10 ). "Methode aufrufen
*  go_glas->leeren( iv_leeren = 3 ).
*
*  DATA(gv_gesamtmenge) = go_glas->get_fuellmenge(  ). "Der Variable die Werte von der Methode geben.
*
*  WRITE: /'Die Gesamtfüllmenge beträgt: ', gv_gesamtmenge.
*  ULINE.

*  go_glas = NEW #( go_gin ).                 "Objekt erstellen / Instanziierung
*
*  go_glas->fuellen( iv_fuellen = 10 ). "Methode aufrufen
*  go_glas->leeren( iv_leeren = 3 ).
*
*  DATA(gv_gesamtmenge2) = go_glas->get_fuellmenge(  ). "Der Variable die Werte von der Methode geben.
*
*  WRITE: /'Die Gesamtfüllmenge beträgt: ', gv_gesamtmenge2.
*  ULINE.
