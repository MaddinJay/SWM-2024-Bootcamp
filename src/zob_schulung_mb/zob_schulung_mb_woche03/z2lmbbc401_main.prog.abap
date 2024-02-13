*&---------------------------------------------------------------------*
*& Report z2lmbbc401_main
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z2lmbbc401_main.

*TYPE-POOLS icon.
CLASS lcl_airplane DEFINITION.


  PUBLIC SECTION.



    METHODS constructor
      IMPORTING iv_name_c            TYPE string
                iv_planetype_c       TYPE saplane-planetype
                iv_number_airplane_c TYPE i.


    METHODS set_airplane_name IMPORTING iv_name TYPE string.
    METHODS    set_planetype IMPORTING iv_planetype TYPE saplane-planetype.
    METHODS display_attributes EXPORTING ev_name      TYPE string
                                         ev_planetype TYPE saplane-planetype.

    CLASS-METHODS display_n_o_airplanes.

    CLASS-METHODS get_n_o_airplanes RETURNING VALUE(rv_count) TYPE i. "funktionelle Methode
    CLASS-METHODS get_n_o_airplanes_exp EXPORTING ev_count TYPE i.

  PRIVATE SECTION.




    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype,
          mv_weight    TYPE saplane-weight,
          mv_tankcap type saplane-tankcap.

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

  METHOD constructor.
    mv_name = iv_name_c.
    mv_planetype = iv_planetype_c.

    select
    from saplane
     fields *
     where planetype = @iv_planetype_c
     into table @data(gt_airplane).
     cl_demo_output=>display( gt_airplane ).


    ADD 1 TO gv_n_o_airplanes.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA: go_airplane TYPE REF TO lcl_airplane.
*gt_airplane type table of ref to lcl_airplane.



*create object go_airplane.
*append go_airplane to gt_airplane.
  lcl_airplane=>display_n_o_airplanes(  ).
  lcl_airplane=>display_n_o_airplanes(  ). "Methode wird 2 mal aufgerufen! deshalb sieht man 2 mal das gleiche bei der Ausgabe
  go_airplane = NEW #( iv_name_c = 'Airbus2'
            iv_planetype_c = 'Boing 700'
            iv_number_airplane_c = 2
           ).
  lcl_airplane=>display_n_o_airplanes(  ). "Bei statischen benutzt man =>



  go_airplane->set_airplane_name( EXPORTING iv_name = 'Airbus' ). " man kann exporting weglassen


  go_airplane->set_planetype( iv_planetype = 'Boing 787' ).
  go_airplane->display_attributes( ).



  DATA gv_number_of_airplanes TYPE i.


  gv_number_of_airplanes = go_airplane->get_n_o_airplanes( ).

  WRITE:/'Counter ist gleich:', gv_number_of_airplanes.

  go_airplane->get_n_o_airplanes_exp(
  IMPORTING
  ev_count = gv_number_of_airplanes
  ).

  WRITE:/'Counter ist gleich:', gv_number_of_airplanes.
