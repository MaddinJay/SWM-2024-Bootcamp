*&---------------------------------------------------------------------*
*& Report ZFD_DATENREFERENZEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFD_DATENREFERENZEN.

Data: lv_zahl type i value 10,
      lr_ref TYPE REF TO i.

Get REFERENCE OF lv_zahl INTO lr_ref.

lr_ref->* = 20.

WRITE lv_zahl.
