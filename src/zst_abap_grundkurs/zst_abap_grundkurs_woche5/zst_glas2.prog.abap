*&---------------------------------------------------------------------*
*& Report zst_glas
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_glas2.
PARAMETERS: p_fuelle TYPE int1,
            p_leer   TYPE int1.

DATA go_glas TYPE REF TO zst_uebung_gefaess.
DATA go_wasser TYPE REF TO zst_uebung_wasser.
DATA go_gin TYPE REF TO zst_uebung_gin.
DATA grt_getraenk TYPE TABLE OF REF TO zst_uebung_getraenk.
DATA gs_getraenk TYPE REF TO zst_uebung_getraenk.

START-OF-SELECTION.

  go_wasser = NEW #(  ). " Up Cast
  APPEND go_wasser TO grt_getraenk.
*********************************************************************
  go_gin = NEW #(  ).
  APPEND go_gin TO grt_getraenk.


  LOOP AT grt_getraenk INTO gs_getraenk.

    go_glas = NEW zst_uebung_glas( gs_getraenk ).
    go_glas->fuellen( iv_menge = p_fuelle ).
    go_glas->leeren( iv_menge = p_leer ).
    DATA(gv_menge) = go_glas->get_fuellmenge(  ).
    IF gv_menge > p_fuelle.
      WRITE: / 'Die Menge Wasser ist: ', gv_menge.
    ELSE.
      WRITE: / 'Die Menge Gin ist: ', gv_menge.
    ENDIF.
  ENDLOOP.
