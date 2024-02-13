*&---------------------------------------------------------------------*
*& Report ZFD_RTTI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_rtti.

TYPES: BEGIN OF lty_person,
         name  TYPE string,
         alter TYPE i,
       END OF lty_person.

DATA lo_struktur TYPE REF TO cl_abap_structdescr.
DATA ls_components  TYPE abap_compdescr.

lo_struktur ?= cl_abap_typedescr=>describe_by_name( 'LTY_PERSON' ) .

Loop AT lo_struktur->components into ls_components.
  Write / ls_components-name.
  endloop.
