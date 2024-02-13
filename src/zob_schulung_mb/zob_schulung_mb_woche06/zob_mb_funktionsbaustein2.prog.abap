*&---------------------------------------------------------------------*
*& Report zob_mb_funktionsbaustein2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_funktionsbaustein2.

DATA: iv_name         TYPE string,
      iv_kdnr         TYPE char10,
      iv_ort          TYPE char35,
      iv_strasse      TYPE char35,
      iv_kontakt      TYPE char35,
      iv_verkaufsdoku TYPE char10.

      iv_name = 'Domestic US Customer 1'.

Call FUNCTION 'ZOBMB_FM_KUNDE'

exporting
ip_name = iv_name
importing
ep_kdnr = iv_kdnr
ep_strasse = iv_strasse
ep_ort = iv_ort
ep_kontakt = iv_kontakt
ep_verkaufsdoku = iv_verkaufsdoku.

write: / iv_name, / iv_kdnr, / iv_strasse, / iv_ort, / iv_kontakt, / iv_verkaufsdoku.
