*&---------------------------------------------------------------------*
*& Report ZMB_DATENREFERENZEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_datenreferenzen.

DATA lv_zahl TYPE i VALUE 10.

DATA lr_ref TYPE REF TO i.

GET REFERENCE OF lv_zahl INTO lr_ref.

lr_ref->* = 20.

Write lv_zahl.
