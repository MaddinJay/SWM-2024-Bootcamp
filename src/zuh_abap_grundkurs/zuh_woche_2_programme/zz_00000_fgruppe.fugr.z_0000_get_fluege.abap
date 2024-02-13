FUNCTION Z_0000_GET_FLUEGE.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_CARRID) TYPE  S_CARR_ID
*"  EXPORTING
*"     REFERENCE(LISTE) TYPE  ZUH_FLISTE
*"----------------------------------------------------------------------


SELECT * FROM spfli INTO TABLE liste where carrid = iv_carrid.


ENDFUNCTION.
