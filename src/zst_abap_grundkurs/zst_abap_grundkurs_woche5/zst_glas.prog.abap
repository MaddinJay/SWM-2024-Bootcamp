*&---------------------------------------------------------------------*
*& Report zst_glas
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_glas.
SELECTION-SCREEN BEGIN OF BLOCK eingabe.

  PARAMETERS: p_menge TYPE int1,
              p_leer  TYPE int1,
              p_getr  TYPE string.

SELECTION-SCREEN END OF BLOCK eingabe.

DATA go_glas TYPE REF TO zst_uebung_glas.
DATA go_wasser TYPE REF TO zst_uebung_wasser.
DATA go_gin TYPE REF TO zst_uebung_gin.

START-OF-SELECTION.

  go_wasser = NEW #( ).

  go_glas = NEW #( go_wasser ).

  go_glas->fuellen( iv_menge = p_menge ).
  go_glas->leeren( iv_menge = p_leer ).

  DATA(gv_menge) = go_glas->get_fuellmenge( ).

  WRITE: 'Die Menge für Wasser ist:', gv_menge.
**********************************************************************
  go_gin = NEW #( ).
  go_glas = NEW #( go_gin ).

  go_glas->fuellen( iv_menge = p_menge ).
  go_glas->leeren( iv_menge = p_leer ).

  DATA(gv_menge2) = go_glas->get_fuellmenge( ).

  WRITE: /, 'Die Menge für Gin ist:', gv_menge2.



*  DATA go_gesamtmenge TYPE int1.



*  CALL METHOD go_glas->fuellen
*    EXPORTING
*      iv_menge = p_menge.
*
*  CALL METHOD go_glas->leeren
*    EXPORTING
*      iv_menge = p_leer.

*  go_gesamtmenge = go_glas->get_fuellmenge( ).
*
*  WRITE: 'Restmenge', go_gesamtmenge.
