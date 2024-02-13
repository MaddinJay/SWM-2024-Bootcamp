*&---------------------------------------------------------------------*
*& Report zuh_oo_video_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_oo_video_2.

CLASS lcl_vehicle DEFINITION.

  PUBLIC SECTION.

    DATA mv_make TYPE string.
    DATA mv_model TYPE string.


ENDCLASS.

CLASS lcl_vehicle IMPLEMENTATION.

ENDCLASS.

DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
DATA gr_vehic TYPE REF TO lcl_vehicle.

CREATE OBJECT gr_vehic.
gr_vehic->mv_make = 'VW'.
gr_vehic->mv_model ='Käfer'.
APPEND gr_vehic TO grt_ref.

CREATE OBJECT gr_vehic.
gr_vehic->mv_make = 'Mercedes'.
gr_vehic->mv_model ='200D'.
APPEND gr_vehic TO grt_ref.

CREATE OBJECT gr_vehic.
gr_vehic->mv_make = 'Ford'.
gr_vehic->mv_model  = 'Taunus'.
APPEND gr_vehic TO grt_ref.

BREAK-POINT.
