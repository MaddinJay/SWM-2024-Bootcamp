*&---------------------------------------------------------------------*
*& Report ZMB_OO3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_oo3.

**********************************************************************
* CLASS lcl_vehicle Defintion
**********************************************************************

CLASS lcl_vehicle DEFINITION.
  PUBLIC SECTION.
    DATA mv_make TYPE string.
    DATA mv_model TYPE string.
ENDCLASS.


**********************************************************************
*  CLASS lcl_vehicle Implementation
**********************************************************************

CLASS lcl_vehicle IMPLEMENTATION.
ENDCLASS.

DATA grt_ref TYPE STANDARD TABLE OF ref to lcl_vehicle.
DATA gr_vehic TYPE REF TO lcl_vehicle.

CREATE OBJECT gr_vehic.
gr_vehic->mv_make = 'VW'.
gr_vehic->mv_model = 'Käfer'.
APPEND gr_vehic TO grt_ref.

CREATE OBJECT gr_vehic.
gr_vehic->mv_make = 'Mercedes'.
gr_vehic->mv_model = '200D'.
APPEND gr_vehic TO grt_ref.

CREATE OBJECT gr_vehic.
gr_vehic->mv_make = 'Ford'.     "es steht 3 Mal Ford Taunus drin,
gr_vehic->mv_model = 'Taunus'.   "wenn man nicht vor jede Variable create Object steht
APPEND gr_vehic TO grt_ref.

BREAK-POINT.
