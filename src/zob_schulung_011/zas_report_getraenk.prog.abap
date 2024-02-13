*&---------------------------------------------------------------------*
*& Report zas_report_getraenk
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_report_getraenk.

START-OF-SELECTION.

  DATA go_getraenk TYPE REF TO z_as_getraenk.
  DATA go_glas TYPE REF TO z_as_glas.
  DATA gv_gesamtmenge TYPE i.
  DATA gv_gesamtmenge2 TYPE i.
  DATA go_gin TYPE REF TO z_as_gin.
  DATA go_gin2 TYPE string.
  DATA go_wasser TYPE REF TO z_as_wasser.
  DATA gt_getraenk TYPE TABLE OF REF TO z_as_getraenk.
  DATA go_ginName TYPE string.
*  DATA gs_getraenk type o

  go_wasser = NEW #( iv_name = 'Wasser' ).
*  go_getraenk = go_wasser.
*  go_glas = NEW #( go_getraenk ).
  APPEND go_wasser TO gt_getraenk.
*  go_glas->fuellen(  iv_menge2 = 10 ).
*  go_glas->leeren(  iv_menge1 = 3 ).

*  cl_demo_output=>display( gt_getraenk ).
*  gv_gesamtmenge = go_glas->getfuellmenge( ).

**********************************************************************
  go_gin = NEW #( iv_name = 'Gin').
  APPEND go_gin TO gt_getraenk.

  LOOP AT gt_getraenk INTO go_getraenk.
    go_glas = NEW #( go_getraenk ).
    go_glas->fuellen(  iv_menge2 = 10 ).
    go_glas->leeren(  iv_menge1 = 3 ).
    gv_gesamtmenge2 = go_glas->getfuellmenge( ).
    go_ginname = go_getraenk->getName(  ).
    WRITE: / | Die Menge von { go_ginname } ist: { gv_gesamtmenge2 } |.

  ENDLOOP.

*  go_glas = NEW #( go_gin ).
*
*  go_glas->fuellen(  iv_menge2 = 10 ).
*  go_glas->leeren(  iv_menge1 = 3 ).
*
*  gv_gesamtmenge2 = go_glas->getfuellmenge( ).
*
*  WRITE: /'Die Menge mit Gin-Klasse ist:', gv_gesamtmenge2.

END-OF-SELECTION.
