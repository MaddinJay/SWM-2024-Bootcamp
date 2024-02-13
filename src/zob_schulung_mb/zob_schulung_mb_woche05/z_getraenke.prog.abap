*&---------------------------------------------------------------------*
*& Report z_getraenke
*&---------------------------------------------------------------------*
*&
*&----------------------_wasser-----------------------------------------------*
REPORT z_getraenke.
*
*
DATA go_getraenk TYPE REF TO zcl_mb_getraenk.
DATA go_glas TYPE REF TO zcl_mb_glas.
DATA go_wasser TYPE REF TO zcl_mb_wasser.
DATA go_gin TYPE REF TO zcl_mb_gin.
DATA lv_fuellmenge TYPE int1.


START-OF-SELECTION.

  DATA gt_getraenkelist TYPE STANDARD TABLE OF REF TO zcl_mb_getraenk.


  go_wasser = NEW #( ).
  APPEND go_wasser TO gt_getraenkelist.

  go_glas = NEW #( go_wasser ).     "Up Cast   hier wird mit Wasser gearbeitet
  go_glas->fuellen( EXPORTING iv_fuellen = 10 ).
  go_glas->leeren( EXPORTING iv_leeren = 5 ).


  DATA(gv_gesamtmenge) = go_glas->getfuellmenge( ).
  WRITE: / 'DIe Menge mit Wasserklasse ist:' ,gv_gesamtmenge.


  go_gin = NEW #( ).
  APPEND go_gin TO gt_getraenkelist.

  LOOP AT gt_getraenkelist INTO go_getraenk.
    go_getraenk->erhoehemenge( iv_menge = 10 ).
    go_getraenk->reduzieremenge( iv_menge = 5 ).
    lv_fuellmenge = go_getraenk->get_menge( ).

    CASE go_getraenk.
      WHEN go_wasser.
        WRITE: /, 'Wasser hat die Füllmenge ' , lv_fuellmenge.

      WHEN go_gin.
        WRITE: /, 'Gin hat die Füllmenge ' , lv_fuellmenge.
    ENDCASE.
  ENDLOOP.

  go_glas = NEW #( go_gin ).
  go_glas->fuellen( EXPORTING iv_fuellen = 100 ).
  go_glas->leeren( EXPORTING iv_leeren = 50 ).

  DATA(gv_gesamtmenge2) = go_glas->getfuellmenge( ).
  WRITE: / 'DIe Menge mit Gin Klasse ist:' ,gv_gesamtmenge2.



  ULINE.




*
END-OF-SELECTION.
