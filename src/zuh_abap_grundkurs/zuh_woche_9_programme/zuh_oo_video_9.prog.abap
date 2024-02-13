*&---------------------------------------------------------------------*
*& Report zuh_oo_video_9
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_oo_video_9.

INCLUDE zuh_vehicle2.
INCLUDE zuh_truck2.
INCLUDE zuh_heavy_tr2.
INCLUDE zuh_bus1.

START-OF-SELECTION.

  DATA grt_vehiclist TYPE STANDARD TABLE OF REF TO lcl_vehicle.
  DATA gr_vehic TYPE REF TO lcl_vehicle.

  ULINE. ULINE.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'VW'
      iv_model = 'Käfer'.
  APPEND gr_vehic TO grt_vehiclist.  "normales Append

  DATA gr_bus TYPE REF TO lcl_bus.
  CREATE OBJECT gr_bus
    EXPORTING
      iv_bpass  = 80
      iv_bmake  = 'Mercedes'
      iv_bmodel = 'Bus'.
  APPEND gr_bus TO grt_vehiclist.   "upcast

  DATA gr_truck TYPE REF TO lcl_truck.
  CREATE OBJECT gr_truck
    EXPORTING
      iv_tmake   = 'MAN'
      iv_tmodel  = 'TGA'
      iv_tweight = 40.
  APPEND gr_truck TO grt_vehiclist.  "upcast




  DATA gv_fuel TYPE i.
  LOOP AT grt_vehiclist INTO gr_vehic.
    TRY.
        gr_truck ?= gr_vehic.
        WRITE / 'Erfolg, das war eine Trauckinstanz.'.
      CATCH cx_sy_move_cast_error.
        WRITE / 'Keine Truckinstanz'.
    ENDTRY.
  ENDLOOP.
