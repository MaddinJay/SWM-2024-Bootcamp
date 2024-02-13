*&---------------------------------------------------------------------*
*& Report zob_hum_fluege
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_hum_fluege.

DATA lv_fluege_gesamt Type i.

CALL Function 'Z_HUM_FB_FG_FLUEGE'
IMPORTING EX_Gesamtfluege = lv_fluege_gesamt.
