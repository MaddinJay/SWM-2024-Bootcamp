*&---------------------------------------------------------------------*
*& Report z_hum_uebung_fuba
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_uebung_fuba.
DATA lv_result type int4.
Call Function 'Z_HUM_FM_RECHNER'
exporting ip_basis = 5
ip_exponent = 7
Importing
ep_result = lv_result.

WRITE lv_result.
