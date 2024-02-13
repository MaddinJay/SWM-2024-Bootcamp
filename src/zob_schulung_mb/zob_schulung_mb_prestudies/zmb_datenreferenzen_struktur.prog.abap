*&---------------------------------------------------------------------*
*& Report ZMB_DATENREFERENZEN_STRUKTUR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMB_DATENREFERENZEN_STRUKTUR.

TYPES: BEGIN OF lty_person,
       name Type string,
       alter Type i,
       End of lty_person.

DATA ls_struktur TYPE lty_person.

Data lr_ref TYPE REF TO lty_person.

Get REFERENCE OF ls_struktur Into lr_ref.

lr_ref->name = 'Meier'.
lr_ref->alter = 40.

Write: ls_struktur-name, ls_struktur-alter.
