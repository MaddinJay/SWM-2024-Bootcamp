FUNCTION z_aw_fm_kontakt.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IP_NAME) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(ET_KONTAKT) TYPE  TABLE
*"----------------------------------------------------------------------
  SELECT
  FROM kna1
  LEFT JOIN knvk ON kna1~kunnr = knvk~kunnr
  FIELDS
 kna1~name1,
  knvk~namev,
  knvk~name1
  WHERE kna1~name1 = @ip_name
  INTO TABLE @et_kontakt.

  cl_demo_output=>display( et_kontakt ).

ENDFUNCTION.
