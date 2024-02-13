*&---------------------------------------------------------------------*
*& Report ZOD_DATENREFERENZEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_datenreferenzen.
TYPES: BEGIN OF lty_person,
         name  TYPE String,
         alter TYPE i,
       END OF lty_person.

DATA: ls_person TYPE lty_person,
      lr_ref    TYPE REF TO lty_person,
      lt_person TYPE lty_person.

GET REFERENCE OF ls_person INTO lr_ref.
lr_ref->name ='MAYER'.
lr_ref->alter = 55.

WRITE: 'Name: ', ls_person-name, 'Alter: ', ls_person-alter.
