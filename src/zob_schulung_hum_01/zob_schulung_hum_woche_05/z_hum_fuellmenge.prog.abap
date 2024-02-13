*&---------------------------------------------------------------------*
*& Report z_hum_fuellmenge
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_fuellmenge.

DATA go_glas TYPE REF TO zcl_glas.
DATA go_getraenk TYPE REF TO zcl_hum_getraenk.
DATA go_gin TYPE REF TO zcl_hum_gin.

DATA go_wasser TYPE REF TO zcl_hum_wasser.
DATA lt_getraenk LIKE TABLE OF go_getraenk.

START-OF-SELECTION.
  go_wasser = NEW #( ).
  go_gin = NEW #( ).

  APPEND go_gin TO lt_getraenk.
  APPEND go_wasser TO lt_getraenk.

  LOOP AT lt_getraenk INTO go_getraenk.
    go_glas = NEW #( go_getraenk ).
    go_glas->yif_hum_gefaess~fuellen( iv_menge = 12 ).
    go_glas->yif_hum_gefaess~leeren( iv_menge = 1 ).

    DATA(gv_menge2) = go_glas->yif_hum_gefaess~get_fuellmenge( ).

    WRITE: / |Die Menge ist: { gv_menge2 }| .

  ENDLOOP.

END-OF-SELECTION.
