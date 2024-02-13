*&---------------------------------------------------------------------*
*& Report z_fb_modular_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_modular_uebung.

DATA go_glas TYPE REF TO z_fb_modular_glas.
DATA go_wasser TYPE REF TO z_fb_modular_wasser.
DATA go_gin TYPE REF TO z_fb_modular_gin.


START-OF-SELECTION.
  go_wasser = NEW #( ).

  go_glas = NEW #( go_wasser ).

  go_glas->yfb_gefaess~fuellen( iv_menge = 10 ).
  go_glas->yfb_gefaess~leeren( iv_menge = 3 ).

  DATA(gv_menge) = go_glas->yfb_gefaess~get_fuellmenge(  ).

  WRITE: 'Die Menge mit Wasserklasse ist:', gv_menge.
**********************************************************************
  go_gin = NEW #( ).
  go_glas = NEW #( go_gin ).

  go_glas->yfb_gefaess~fuellen( iv_menge = 10 ).
  go_glas->yfb_gefaess~leeren( iv_menge = 3 ).

  DATA(gv_menge2) = go_glas->yfb_gefaess~get_fuellmenge(  ).

  WRITE: /'Die Menge mit Gin-Klasse ist:', gv_menge2.
