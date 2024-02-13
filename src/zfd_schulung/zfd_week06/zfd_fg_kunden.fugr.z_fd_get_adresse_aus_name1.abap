FUNCTION z_fd_get_adresse_aus_name1.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_NAME1) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(EV_STRAS) TYPE  STRING
*"     REFERENCE(EV_PSTLZ) TYPE  STRING
*"     REFERENCE(EV_ORT01) TYPE  STRING
*"     REFERENCE(EV_LAND1) TYPE  STRING
*"----------------------------------------------------------------------




  SELECT SINGLE
    FROM kna1
    FIELDS
*    name1,
    stras,
    pstlz,
    ort01,
    land1
    WHERE name1 = @iv_name1
*    INTO @DATA(is_kunde).
 INTO (@ev_stras, @ev_pstlz, @ev_ort01, @ev_land1).

*  ENDSELECT.

*  ev_stras = is_kunde-stras.
*  ev_pstlz = is_kunde-pstlz.
*  ev_ort01 = is_kunde-ort01.
*  ev_land1 = is_kunde-land1.


ENDFUNCTION.
