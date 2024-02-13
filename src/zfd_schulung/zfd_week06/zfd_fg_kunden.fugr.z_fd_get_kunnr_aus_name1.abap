FUNCTION z_fd_get_kunnr_aus_name1.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_NAME1) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(ET_KUNDE) TYPE  TABLE
*"----------------------------------------------------------------------

  SELECT
  FROM kna1
  FIELDS
  name1,
  kunnr
  WHERE name1 = @iv_name1
  INTO table @et_kunde.

*  cl_demo_output=>display( et_kunde ).



*    SELECT
*  FROM kna1
*  FIELDS
*  name1,
*  kunnr
*  WHERE name1 = @iv_name1
*  INTO @DATA(it_tab).
*  ENDSELECT.

*  ev_kunnr = it_tab-kunnr.

ENDFUNCTION.
