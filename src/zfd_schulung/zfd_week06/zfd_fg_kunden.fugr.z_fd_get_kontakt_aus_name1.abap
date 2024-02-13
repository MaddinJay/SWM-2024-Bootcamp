FUNCTION z_fd_get_kontakt_aus_name1.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_NAME1) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(EV_KONTAKT_NAME) TYPE  STRING
*"     REFERENCE(EV_KONTAKT_VORNAME) TYPE  STRING
*"----------------------------------------------------------------------
  SELECT
  FROM kna1
  LEFT OUTER JOIN knvk ON kna1~kunnr = knvk~kunnr
  FIELDS
    kna1~name1 AS kna1name1,
    knvk~name1 AS knvkname1,
    knvk~namev AS knvknamev
  WHERE kna1~name1 = @iv_name1
  INTO @DATA(is_struc).
  ENDSELECT.

  ev_kontakt_name = is_struc-knvkname1.
  ev_kontakt_vorname = is_struc-knvknamev.


ENDFUNCTION.
