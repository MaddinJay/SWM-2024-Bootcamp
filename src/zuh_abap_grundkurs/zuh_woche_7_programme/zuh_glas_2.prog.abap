*&---------------------------------------------------------------------*
*& Report zuh_glas_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_glas_2.

DATA go_glas TYPE REF TO zuh_glas.
DATA go_wasser TYPE REF TO zuh_wasser.
DATA go_gin TYPE REF TO zuh_gin.
DATA go_getraenk TYPE REF TO zuh_getraenk_mg.
DATA lt_tabelle TYPE TABLE OF REF TO zuh_getraenk_mg.

START-OF-SELECTION.
  go_wasser = NEW #( ).
  APPEND go_wasser TO lt_tabelle.
  go_gin = NEW #( ).
  APPEND go_gin TO lt_tabelle.

  LOOP AT lt_tabelle INTO go_getraenk.

    go_glas = NEW zuh_glas( go_getraenk ).
    go_glas->fuellen( iv_menge = 10 ).
    go_glas->leeren1( iv_menge = 3 ).

    DATA(gv_menge) = go_glas->get_fuellmenge( ).

    CASE go_getraenk.
      WHEN go_wasser.
        WRITE: / |Wasserfüllmenge { gv_menge } dl|.
      WHEN go_gin.
        WRITE: / |Ginfüllmenge { gv_menge } dl|.
    ENDCASE.

  ENDLOOP.
