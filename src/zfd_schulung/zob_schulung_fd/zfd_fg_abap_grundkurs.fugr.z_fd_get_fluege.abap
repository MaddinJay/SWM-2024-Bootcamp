FUNCTION Z_FD_GET_FLUEGE.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_CARRID) TYPE  S_CARR_ID
*"  EXPORTING
*"     REFERENCE(ET_LISTE) TYPE  ZFD_T_FLISTE
*"----------------------------------------------------------------------

SELECT * FROM spfli INTO TABLE ET_Liste WHERE carrid = iv_carrid.

IF sy-subrc <> 0.
  WRITE 'Fehler beim Auslesen der Tabelle.'.
ENDIF.

ENDFUNCTION.
