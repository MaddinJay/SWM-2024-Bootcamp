*&---------------------------------------------------------------------*
*& Report ZFD_RTTC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFD_RTTC.

TYPES: BEGIN OF lty_person,
         name  TYPE string,
         alter TYPE i,
       END OF lty_person.

DATA lo_struktur TYPE REF TO cl_abap_structdescr.
DATA lo_tabelle TYPE REF TO cl_abap_tabledescr.

DATA lr_tabelle TYPE REF TO data.

lo_struktur ?= cl_abap_typedescr=>describe_by_name( 'LTY_PERSON' ) .

lo_tabelle = cl_abap_tabledescr=>create( p_line_type = lo_struktur ).

CREATE DATA lr_tabelle TYPE HANDLE lo_tabelle.
