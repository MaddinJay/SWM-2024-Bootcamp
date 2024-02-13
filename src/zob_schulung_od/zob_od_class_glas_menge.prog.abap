*&---------------------------------------------------------------------*
*& Report zob_od_class_glas_menge
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_class_glas_menge.

DATA go_glas TYPE REF TO zob_od_glass_class.
DATA go_wasser TYPE REF TO zob_od_lcl_wasser.
DATA go_gin TYPE REF TO zob_od_lcl_gin.

*zob_od_glass_class

START-OF-SELECTION.
  go_wasser = NEW #( ).
  go_glas = NEW  #( go_wasser ).

*  go_gin = NEW #( ).

  go_glas->fuellen( iv_menge = 5 ).
  go_glas->leeren( iv_menge = 3 ).

  DATA(gv_menge) = go_glas->get_fuellmenge(  ).

  WRITE: 'Die Menge ist:', gv_menge.

  go_gin = NEW #( ).
  go_glas = NEW #( go_gin ).

  go_glas->fuellen( iv_menge = 11 ).
  go_glas->leeren( iv_menge = 3 ).

  DATA(gv_menge2) = go_glas->get_fuellmenge(  ).

  WRITE: 'Die Menge ist:', gv_menge2.
