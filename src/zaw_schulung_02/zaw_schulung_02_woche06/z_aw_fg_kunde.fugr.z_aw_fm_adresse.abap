FUNCTION z_aw_fm_adresse.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_NAME) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(EV_STRAS) TYPE  STRING
*"     REFERENCE(EV_PLZ) TYPE  PSTLZ
*"     REFERENCE(EV_ORT) TYPE  STRING
*"     REFERENCE(EV_REGIO) TYPE  REGIO
*"----------------------------------------------------------------------


  SELECT SINGLE
    FROM kna1
    FIELDS
    stras AS Strasse,
    pstlz AS Postleitzahl,
    ort01 AS Ort,
    regio AS Region
    WHERE name1 = @ip_name
    INTO (@ev_stras, @ev_plz, @ev_ort, @ev_regio).



ENDFUNCTION.
