FUNCTION z_od_get_fluege.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_CARRID) TYPE  S_CARR_ID
*"  EXPORTING
*"     REFERENCE(ET_FLUEGE) TYPE  SPFLI_TAB
*"----------------------------------------------------------------------

 SELECT * FROM spfli INTO TABLE et_fluege WHERE carrid EQ iv_carrid.

  IF sy-subrc <> 0.
    WRITE 'Fehler beim auslesen der Tab'.

  ENDIF.

ENDFUNCTION.
