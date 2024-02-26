*&---------------------------------------------------------------------*
*& Report ztw_oo_methods
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_oo_methods.

*Klassendefinition
CLASS lcl_vehicle DEFINITION.

  PUBLIC SECTION.

    DATA mv_make TYPE string.
    METHODS display_attributes.


  PRIVATE SECTION.
    DATA mv_model TYPE string.
    METHODS hello_world.

ENDCLASS.



*Klassenimplementierung
CLASS lcl_vehicle IMPLEMENTATION.

  METHOD hello_world.
    WRITE / 'Hello World'.
  ENDMETHOD.

  METHOD display_attributes.
  WRITE: 'Make: ', mv_make.
  WRITE: 'Model: ', mv_model.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
  DATA gr_vehic TYPE REF TO lcl_vehicle.

  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'VW'.
*gr_vehic->mv_model = 'Arteon'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'Mercedes'.
*gr_vehic->mv_model = 'S-Klasse'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic.
  gr_vehic->mv_make = 'Audi'.
*gr_vehic->mv_model = 'Q5'.
  APPEND gr_vehic TO grt_ref.
