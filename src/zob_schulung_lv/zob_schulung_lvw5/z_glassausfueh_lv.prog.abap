*&---------------------------------------------------------------------*
*& Report z_glassausfueh_lv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_glassausfueh_lv.

SELECTION-SCREEN BEGIN OF BLOCK glassmenge WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_menge  TYPE int1,
              p_mengl  TYPE int1,
              p_fuelle TYPE string.
SELECTION-SCREEN END OF BLOCK glassmenge.

DATA(lo_Z_UEBUNG_GLASS_LV) = NEW z_uebung_glass_LV( ).

CALL METHOD lo_z_uebung_glass_lv->fuellen
  EXPORTING
    iv_menge = p_menge.

CALL METHOD lo_z_uebung_glass_lv->fuellen
  EXPORTING
    iv_menge = p_menge.

CALL METHOD lo_z_uebung_glass_lv->leeren
  EXPORTING
    iv_menge = p_mengl.

*lo_z_uebung_glass_lv->getfuellmenge(  ).

DATA: fuellmenge TYPE int1.
fuellmenge = lo_z_uebung_glass_lv->getfuellmenge(  ).
*WRITE: fuellmenge.
