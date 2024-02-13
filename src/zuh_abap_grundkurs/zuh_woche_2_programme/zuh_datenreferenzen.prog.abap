*&---------------------------------------------------------------------*
*& Report ZUH_DATENREFERENZEN
*&---------------------------------------------------------------------*
*& lr_ref ist nur ein Zeiger und hat keinen Wert
*&---------------------------------------------------------------------*
REPORT zuh_datenreferenzen.

DATA lv_zahl TYPE i VALUE 10.

DATA lr_ref TYPE REF TO i.

GET REFERENCE OF lv_zahl INTO lr_ref.

lr_ref->* = 20.

WRITE: lv_zahl.
