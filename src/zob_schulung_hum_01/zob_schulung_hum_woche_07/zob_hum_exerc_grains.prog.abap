*&---------------------------------------------------------------------*
*& Report zob_hum_exerc_grains
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_hum_exerc_grains.

Parameters p_feld Type i.
DATA lv_result_feld Type decfloat34.
DATA lv_result_gesamt Type decfloat34.
DATA(lo_grain) = New zcl_hum_EXERC_GRAINs( ).

lv_result_feld = lo_grain->square( Exporting input = p_feld ).
lv_result_gesamt = lo_grain->total( ).

Write: |Die Menge Reis auf Feld { p_feld } beträgt { lv_result_feld } Körner. Auf den 64 Feldern befinden sich insgesamt { lv_result_gesamt } Reiskörner|.
