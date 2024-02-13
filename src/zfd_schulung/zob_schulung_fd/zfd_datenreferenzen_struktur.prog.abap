*&---------------------------------------------------------------------*
*& Report ZFD_DATENREFERENZEN_STRUKTUR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFD_DATENREFERENZEN_STRUKTUR.

TYPES: BEGIN OF lty_person,
  name TYPE string,
  alter TYPE i,
  End of  lty_person.

 Data: ls_struktur type lty_person,
       lr_ref TYPE REF TO lty_person.

Get REFERENCE OF ls_struktur INTO lr_ref.

lr_ref->name = 'Boll'.
lr_ref->alter = '42'.

WRITE: ls_struktur-name, ls_struktur-alter.
