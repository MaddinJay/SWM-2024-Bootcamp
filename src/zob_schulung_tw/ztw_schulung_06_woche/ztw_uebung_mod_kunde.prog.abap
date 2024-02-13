*&---------------------------------------------------------------------*
*& Report ztw_uebung_mod_kunde
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_uebung_mod_kunde.

Parameters p_name type string.

TYPES: BEGIN OF lty_s_kunde,
         Kundennummer type string,
         Kundenname type string,
         Strasse type string,
       END OF lty_s_kunde,
       lty_t_kunde TYPE TABLE OF lty_s_kunde.

DATA: ls_kunde TYPE lty_s_kunde,
      lt_kunde TYPE lty_t_kunde.


CALL FUNCTION 'Z_AW_FM_KUNDENNUMMER'
  EXPORTING
    ip_name = p_name

  IMPORTING
    et_kunde = lt_kunde.

LOOP AT lt_kunde INTO ls_kunde.
write: / ls_kunde-kundenname, ls_kunde-kundennummer.
ENDLOOP.
