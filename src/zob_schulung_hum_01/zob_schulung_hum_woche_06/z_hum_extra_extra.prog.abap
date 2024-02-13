*&---------------------------------------------------------------------*
*& Report z_hum_extra_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_extra_extra.

Parameters p_dat Type vbak-audat.

Data lo_Verkaufsbelege Type ref to zcl_hum_extra_extra.

create object lo_verkaufsbelege.

call method lo_verkaufsbelege->ausgabe_verkaufsbelege
exporting iv_datum = p_dat.
