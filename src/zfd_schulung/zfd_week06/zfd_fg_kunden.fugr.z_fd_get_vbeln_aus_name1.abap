FUNCTION z_fd_get_vbeln_aus_name1.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_NAME1) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(ET_VBELN) TYPE  TABLE
*"----------------------------------------------------------------------
  SELECT
    FROM vbak
    LEFT OUTER JOIN kna1 ON vbak~kunnr = kna1~kunnr
    FIELDS
      kna1~name1,
      vbak~vbeln
    WHERE kna1~name1 = @iv_name1
    INTO TABLE @et_vbeln.

ENDFUNCTION.
