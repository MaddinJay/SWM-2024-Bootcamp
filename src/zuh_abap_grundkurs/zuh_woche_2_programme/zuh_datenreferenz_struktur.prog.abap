*&---------------------------------------------------------------------*
*& Report ZUH_DATENREFERENZ_STRUKTUR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_datenreferenz_struktur.

TYPES: BEGIN OF lty_person,
         name  TYPE string,
         alter TYPE i,
       END OF lty_person.

DATA ls_struktur TYPE lty_person.

DATA lr_ref TYPE REF TO lty_person.

GET REFERENCE OF ls_struktur INTO lr_ref.

lr_ref->name = 'Meier'.
lr_ref->alter = 54.

Write: ls_struktur-name, ls_struktur-alter.
