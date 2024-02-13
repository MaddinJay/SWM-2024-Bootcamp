*&---------------------------------------------------------------------*
*& Report zaw_modularisierung_klassen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_modularisierung_klassen.


DATA go_fuellstand TYPE REF TO zaw_gcl_glas.

DATA go_wasser TYPE REF TO zaw_gcl_wasser.
DATA go_gin TYPE REF TO zaw_gcl_gin.

DATA lv_fuellmenge TYPE int1.

DATA: lt_getraenk TYPE TABLE OF REF TO zaw_gcl_getraenk,
      go_getraenk TYPE REF TO zaw_gcl_getraenk,
      go_name     TYPE string.


**********************************************************************

START-OF-SELECTION.

**********************************************************************

  go_wasser = NEW #( iv_name = 'Wasser' ).
  go_fuellstand = NEW #( go_wasser ).

  go_fuellstand->fuellen( iv_fuellmenge = 10 ).
  go_fuellstand->leeren( iv_leermenge = 3 ).

  lv_fuellmenge = go_fuellstand->get_fuellmenge( ).

  WRITE: / |Füllstand Wasser: { lv_fuellmenge } dl|.

**********************************************************************

  go_gin = NEW #( iv_name = 'Gin' ).
  go_fuellstand = NEW zaw_gcl_glas( go_gin ).

  go_fuellstand->fuellen( iv_fuellmenge = 10 ).
  go_fuellstand->leeren( iv_leermenge = 3 ).

  lv_fuellmenge = go_fuellstand->get_fuellmenge( ).

  WRITE: / |Füllstand Gin: { lv_fuellmenge } dl|.

**********************************************************************

  ULINE.

  go_wasser = NEW #( iv_name = 'Wasser' ).
  APPEND go_wasser TO lt_getraenk.
  go_gin = NEW #( iv_name = 'Gin' ).
  APPEND go_gin TO lt_getraenk.

  LOOP AT lt_getraenk INTO go_getraenk.

    go_fuellstand = NEW zaw_gcl_glas( go_getraenk ).
    go_fuellstand->fuellen( iv_fuellmenge = 10 ).
    go_fuellstand->leeren( iv_leermenge = 3 ).
    lv_fuellmenge = go_fuellstand->get_fuellmenge( ).
    go_name = go_getraenk->get_name(  ).

    WRITE: / |Füllstand (Tabelle) von { go_name }: { lv_fuellmenge } dl|.

  ENDLOOP.
