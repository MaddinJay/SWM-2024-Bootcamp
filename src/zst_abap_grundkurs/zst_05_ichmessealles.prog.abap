*&---------------------------------------------------------------------*
*& Report ZST_05_ICHMESSEALLES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZST_05_ICHMESSEALLES.

DATA: gd_buch_seiten TYPE zst_05_td_anz_seiten.

TYPES: BEGIN OF gst_buch,
  buch_titel Type string,
  anz_seiten TYPE zst_05_td_anz_seiten,
  END OF gst_buch.

  DATA gs_buch TYPE gst_buch.
  gs_buch-buch_titel = 'Schrödinger programmiert ABAP'.
