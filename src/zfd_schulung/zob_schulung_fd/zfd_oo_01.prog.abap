*&---------------------------------------------------------------------*
*& Report ZFD_OO_01
*&---------------------------------------------------------------------*

REPORT zfd_oo_01.

INCLUDE zfd_if_wheel.
INCLUDE Zfd_vehicle.
INCLUDE zfd_truck.
INCLUDE zfd_heavy_tr.
INCLUDE zfd_bus.
INCLUDE zfd_angebotsliste.

START-OF-SELECTION.
  DATA grt_vehiclist TYPE STANDARD TABLE OF REF TO lcl_vehicle.
  DATA gr_vehic TYPE REF TO lcl_vehicle.

  DATA gr_angebotsliste TYPE REF TO lcl_angebotsliste.
  gr_angebotsliste = NEW #(  ).

  CREATE OBJECT gr_vehic
    EXPORTING
      iv_make  = 'VW'
      iv_model = 'Käfer'.
  APPEND gr_vehic TO grt_vehiclist. " normales Append

*  CREATE OBJECT gr_vehic
*    EXPORTING
*      iv_make  = 'Mercedes'
*      iv_model = '200D'.
*  APPEND gr_vehic TO grt_vehiclist.
*  CREATE OBJECT gr_vehic
*    EXPORTING
*      iv_make  = 'Ford'
*      iv_model = 'Taunus'.
*  APPEND gr_vehic TO grt_vehiclist.

  DATA gr_bus TYPE REF TO lcl_bus.
  gr_bus = NEW #( iv_bpass = 80 iv_bmake = 'Mercedes'  iv_bmodel = 'Bus'  ).
  APPEND gr_bus TO grt_vehiclist. " Upcast

  DATA gr_truck TYPE REF TO lcl_truck.
  CREATE OBJECT gr_truck
    EXPORTING
      iv_tmake   = 'MAN'
      iv_tmodel  = 'TGA'
      iv_tweight = 40.
  APPEND gr_truck TO grt_vehiclist. " Upcast


  DATA gv_fuel TYPE i.
  LOOP AT grt_vehiclist INTO gr_vehic.
*    IF gr_vehic IS INSTANCE OF lcl_truck.
*      gr_truck ?=  gr_vehic.
*      WRITE / ' Erfolg, dass war eine Truckinstanz.'.
*    ELSE.
*      WRITE / 'keine Truckinstanz.'.
*    ENDIF.

    TRY.
        gr_truck ?= gr_vehic.
        WRITE / ' Erfolg, dass war eine Truckinstanz.'.
        " Normalerweise ruf man hier jetzt spezielle Truck-Methoden auf!
        gr_truck->lif_wheel~check_wheel( ).
      CATCH cx_sy_move_cast_error.
        WRITE / 'keine Truckinstanz.'.
        " hier könnte man einen 2.ten Downcast z.B. auf einen Bus wieder mit TRY machen!
    ENDTRY.
  ENDLOOP.

  DATA gr_heavy_tr TYPE REF TO lcl_heavy_tr.
  gr_heavy_tr = NEW #(  iv_tmake = 'MAN'
                        iv_tmodel = 'TGX'
                        iv_tweight = 80 ).
  gr_heavy_tr->lif_wheel~check_wheel(  ).

  lcl_truck=>lif_wheel~get_no_of_wheels( ).
  lcl_heavy_tr=>lif_wheel~get_no_of_wheels( ).


  DATA gr_wheel TYPE REF TO lif_wheel.
  gr_wheel = gr_truck. " Upcast
  gr_wheel->check_wheel(  ).
