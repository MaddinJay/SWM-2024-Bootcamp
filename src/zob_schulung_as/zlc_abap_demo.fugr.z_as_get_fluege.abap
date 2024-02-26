FUNCTION Z_AS_GET_FLUEGE.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_CARRID) TYPE  S_CARR_ID
*"  EXPORTING
*"     REFERENCE(ET_LISTE) TYPE  ZAS_FLISTE
*"----------------------------------------------------------------------

SELECT * FROM spfli INTO TABLE et_liste WHERE carrid = iv_carrid.

IF sy-subrc <> 0.
  WRITE 'Fehlermeldung!'.
ENDIF.

ENDFUNCTION.
