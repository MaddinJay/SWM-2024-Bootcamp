*&---------------------------------------------------------------------*
*& Report z_hum_constructor
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_constructor.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.



    METHODS: constructor                 "Definition Constructor Methode

      IMPORTING iv_name_c            TYPE string
                iv_planetype_c       TYPE saplane-planetype
                iv_number_airplane_c TYPE i
                iv_weight            TYPE saplane-weight
                iv_tankcap           TYPE saplane-tankcap,


      set_airplane_name IMPORTING iv_name TYPE string,

      set_planetype IMPORTING iv_planetype TYPE saplane-planetype,

      display_attributes EXPORTING ev_name      TYPE string
                                   ev_planetype TYPE saplane-planetype.

    CLASS-METHODS: display_n_o_airplanes,

      get_n_o_airplanes RETURNING VALUE(rv_count) TYPE i, "funktionelle Methode
      get_n_o_airplanes_exp EXPORTING ev_count TYPE i.

  PRIVATE SECTION.

    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype,
          mv_weight    TYPE saplane-weight,
          mv_tankcap   TYPE saplane-tankcap.

    CLASS-DATA: gv_n_o_airplanes TYPE i.   " statische Methode



ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD set_airplane_name.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD set_planetype.
    mv_planetype = iv_planetype.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE: 'Airplane Name:', mv_name.
    WRITE: /'Planetype:', mv_planetype.
    WRITE: / 'Gewicht:', mv_weight.
    WRITE: / 'Tankcap:', mv_tankcap.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: /'Number of Airplanes', gv_n_o_airplanes,/.
  ENDMETHOD.


  METHOD get_n_o_airplanes.
    rv_count = gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplanes_exp.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    ev_count = gv_n_o_airplanes.
  ENDMETHOD.

  METHOD constructor.          "Konstruktor Methode
    mv_name = iv_name_c.
    mv_planetype = iv_planetype_c.
    mv_weight = iv_weight.
    mv_tankcap = iv_tankcap.
    ADD 1 TO gv_n_o_airplanes.

  ENDMETHOD.


ENDCLASS.



START-OF-SELECTION.

  DATA: go_airplane TYPE REF TO lcl_airplane.

  lcl_airplane=>display_n_o_airplanes(  ).
  lcl_airplane=>display_n_o_airplanes(  ). "Methode wird 2 mal aufgerufen! deshalb sieht man 2 mal das gleiche bei der Ausgabe
  go_airplane = NEW #( iv_name_c            = 'Airbus2'
                       iv_planetype_c       = 'Boing 700'
                       iv_number_airplane_c = 2
                       iv_weight            = 100000
                       iv_tankcap           = 200 ).
  lcl_airplane=>display_n_o_airplanes(  ). "Bei statischen benutzt man =>


  go_airplane->set_airplane_name( EXPORTING iv_name = 'Airbus' ). " man kann exporting weglassen


  go_airplane->set_planetype( iv_planetype = 'Boing 787' ).
  go_airplane->display_attributes( ).



  DATA: gv_number_of_airplanes TYPE i,
        gv_weight              TYPE saplane-weight,
        gv_tankcap             TYPE saplane-tankcap.


  gv_number_of_airplanes = go_airplane->get_n_o_airplanes( ).

  WRITE:/'Counter ist gleich:', gv_number_of_airplanes.

  go_airplane->get_n_o_airplanes_exp(
    IMPORTING
      ev_count = gv_number_of_airplanes ).
