*&---------------------------------------------------------------------*
*& Report ZFD_UEBUNG4_DATENREFERENZ
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_uebung4_datenreferenz.

TYPES: BEGIN OF lty_person,
         name  TYPE string,
         alter TYPE i,
       END OF  lty_person.

DATA: ls_struktur TYPE lty_person,
      lt_tabelle  TYPE TABLE OF lty_person,
      lr_ref      TYPE REF TO lty_person.

GET REFERENCE OF ls_struktur INTO lr_ref.

lr_ref->name = 'Boll'.
lr_ref->alter = '42'.
Append lr_ref->* to lt_tabelle.

lr_ref->name = 'Fetzner'.
lr_ref->alter = '53'.
Append lr_ref->* to lt_tabelle.

LOOP AT lt_tabelle into lr_ref->*.
  write: /, lr_ref->name, lr_ref->alter.
ENDLOOP.
