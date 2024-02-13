*&---------------------------------------------------------------------*
*& Report zuh_oo_video_3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_oo_video_3.

CLASS lcl_vehicle DEFINITION.

  PUBLIC SECTION.
    TYPES: BEGIN OF ts_lokal,
             feld1 TYPE i,
             feld2 TYPE string,
           END OF ts_lokal.

    DATA mv_make TYPE string.

    METHODS display_attributes.


  PRIVATE SECTION.
    DATA mv_model TYPE string.
    DATA ms_lokal TYPE ts_lokal.

    METHODS hello_world.


ENDCLASS.

CLASS lcl_vehicle IMPLEMENTATION.

  METHOD hello_world.
    WRITE / 'Hello World'.
  ENDMETHOD.

  METHOD display_attributes.
    hello_world( ).
    WRITE:/ mv_make, mv_model.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
  DATA gr_vehic TYPE REF TO lcl_vehicle.

  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'VW'.
*gr_vehic->mv_model ='Käfer'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'Mercedes'.
*gr_vehic->mv_model ='200D'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'Ford'.
*gr_vehic->mv_model  = 'Taunus'.
  APPEND gr_vehic TO grt_ref.

*  gr_vehic->hello_world( ).
  gr_vehic->display_attributes( ).
