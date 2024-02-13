*&---------------------------------------------------------------------*
*& Report zmj_glas_getraenk_beispiel
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmj_glas_getraenk_beispiel.


DATA go_glas TYPE REF TO zcl_mj_glas.
DATA go_wasser TYPE REF TO zcl_mj_wasser.
DATA go_gin TYPE REF TO zcl_mj_gin.
DATA go_getraenk TYPE REF TO zcl_mj_getraenk.


START-OF-SELECTION.
  go_wasser = NEW #( ).

  go_getraenk = go_wasser.
  go_glas = NEW zcl_mj_glas( go_getraenk ).

  go_glas->fuellen( iv_menge = 10 ).
  go_glas->leeren( iv_menge = 3 ).

  DATA(gv_menge) = go_glas->get_fuellmenge( ).

  WRITE: 'Die Menge mit Wasserklasse ist:', gv_menge.
**********************************************************************
*  go_gin = NEW #( ).
*  go_glas = NEW #( go_gin ).
*
*  go_glas->fuellen( iv_menge = 10 ).
*  go_glas->leeren( iv_menge = 3 ).
*
*  DATA(gv_menge2) = go_glas->get_fuellmenge( ).
*
*  WRITE: /'Die Menge mit Gin-Klasse ist:', gv_menge2.


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
