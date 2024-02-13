*&---------------------------------------------------------------------*
*& Report ZUH_DATENREFERENZEN_UEBUNG4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_datenreferenzen_uebung4.

TYPES: BEGIN OF lty_person,
         name  TYPE string,
         alter TYPE i,
       END OF lty_person.

DATA ls_struktur TYPE lty_person.
DATA lt_table TYPE TABLE OF lty_person.

DATA lr_ref TYPE REF TO lty_person.

GET REFERENCE OF ls_struktur INTO lr_ref.

lr_ref->name = 'Meier'.
lr_ref->alter = 54.
INSERT lr_ref->* INTO TABLE lt_table.

lr_ref->name = 'Müller'.
lr_ref->alter = 20.
INSERT lr_ref->* INTO TABLE lt_table.

LOOP AT lt_table INTO lr_ref->*.
  WRITE: / lr_ref->name, lr_ref->alter.

ENDLOOP.
