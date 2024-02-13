*&---------------------------------------------------------------------*
*& Report zuh_oo_video_7
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_oo_video_7.

INCLUDE zuh_vehicle1.
INCLUDE zuh_truck1.
INCLUDE zuh_heavy_tr1.

START-OF-SELECTION.

  DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle.
  DATA gr_vehic TYPE REF TO lcl_vehicle.

  lcl_truck=>stat_meth_vehic( ).
  lcl_truck=>stat_meth_truck( ).

  ULINE. ULINE.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'VW'
      iv_model = 'Käfer'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'Mercedes'
      iv_model = '200D'.
  APPEND gr_vehic TO grt_ref.

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'Ford'
      iv_model = 'Taunus'.
  APPEND gr_vehic TO grt_ref.


  LOOP AT grt_ref INTO gr_vehic
  WHERE table_line->mv_make = 'VW'.
    gr_vehic->display_attributes( ).
    ULINE.
  ENDLOOP.

  DATA gr_truck TYPE REF TO lcl_truck.
  CREATE OBJECT gr_truck
    EXPORTING
      iv_tmake   = 'MAN'
      iv_tmodel  = 'TGA'
      iv_tweight = 40.

  gr_truck->set_weight( iv_weight = 40 ).
  gr_truck->display_attributes( ).

  lcl_heavy_tr=>get_counter( ).
  lcl_truck=>get_counter( ).
  lcl_vehicle=>get_counter( ).
