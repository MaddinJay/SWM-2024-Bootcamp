*&---------------------------------------------------------------------*
*& Report ZAW_OO_PRE1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_oo_pre1.

CLASS lcl_fahrzeug DEFINITION.
  PUBLIC SECTION.
    DATA: mv_marke  TYPE string,
          mv_modell TYPE string.
ENDCLASS.

CLASS lcl_fahrzeug IMPLEMENTATION.
ENDCLASS.

DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_fahrzeug.
DATA gr_ref TYPE REF TO lcl_fahrzeug.

CREATE OBJECT gr_ref.
gr_ref->mv_marke = 'VW'.
gr_ref->mv_modell = 'Käfer'.
APPEND gr_ref TO grt_ref.

CREATE OBJECT gr_ref.
gr_ref->mv_marke = 'Ford'.
gr_ref->mv_modell = 'Taunus'.
APPEND gr_ref TO grt_ref.

CREATE OBJECT gr_ref.
gr_ref->mv_marke = 'Seat'.
gr_ref->mv_modell = 'Leon'.
APPEND gr_ref TO grt_ref.

BREAK-POINT.
