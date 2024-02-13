*&---------------------------------------------------------------------*
*& Report zuh_funktionsgruppe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_funktionsgruppe.

PARAMETERS: p_name type string.



DATA: iv_name    TYPE string,
      iv_kdnr    TYPE char10,
      iv_ort     TYPE char35,
      iv_stras   TYPE char35,
      iv_kontakt TYPE char35,
      iv_beleg   TYPE char10.

iv_name = 'Queen'.

CALL FUNCTION 'Z_KUNDENAUSWERTUNG'
  EXPORTING
    ip_name    = iv_name
  IMPORTING
    ep_kdnr    = iv_kdnr
    ep_ort     = iv_ort
    ep_stras   = iv_stras
    ep_kontakt = iv_kontakt
    ep_beleg   = iv_beleg.

WRITE / |Kundennr: { iv_kdnr }|.
WRITE / |Ort: { iv_ort }|.
WRITE / |Straße: { iv_stras }|.
WRITE / |Kontakt: { iv_kontakt }|.
WRITE / |Beleg: { iv_beleg }|.
