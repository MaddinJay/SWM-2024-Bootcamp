*&---------------------------------------------------------------------*
*& Report zst_uebung_0901
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_uebung_0901.

PARAMETERS: p_dat TYPE vbak-audat.


DATA lo_verkaufsbelege TYPE REF TO zst_cl_uebung_0901.
CREATE OBJECT lo_verkaufsbelege.

CALL METHOD lo_verkaufsbelege->ausgabe_verkaufsbelege
  EXPORTING
    iv_date = p_dat.
