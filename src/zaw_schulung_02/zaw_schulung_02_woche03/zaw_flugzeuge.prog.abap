*&---------------------------------------------------------------------*
*& Report zaw_flugzeuge
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_flugzeuge.


CLASS lcl_airplane DEFINITION. "lokale Klasse

  PUBLIC SECTION.
    METHODS:
      set_airplane_name IMPORTING iv_name TYPE string, "Es werden Daten von außen importiert.
      set_planetype IMPORTING iv_planetype TYPE saplane-planetype, "Er werden Daten von außen importiert.
      display_attributes.


    CLASS-METHODS: display_n_o_airplanes,
      get_n_o_airplanes RETURNING VALUE(rv_count) TYPE i. "öffentliche statische Methode

  PRIVATE SECTION.
    DATA:
      mv_name      TYPE string,
      mv_planetype TYPE saplane-planetype.

    CLASS-DATA gv_n_o_airplanes TYPE i. "privates statisches Attribut

ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD set_airplane_name.
    mv_name = iv_name.
    ULINE.
    WRITE: icon_red_light, / iv_name.
  ENDMETHOD.

  METHOD set_planetype.
    mv_planetype = iv_planetype.
    WRITE: iv_planetype.
  ENDMETHOD.

  METHOD display_attributes.
    ULINE.
    WRITE: icon_green_light,
     / 'Airplane Name: ', mv_name,
     / 'Planetype: ', mv_planetype.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: / |Number of airplanes: { gv_n_o_airplanes }|.
  ENDMETHOD.

  METHOD get_n_o_airplanes.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    rv_count = gv_n_o_airplanes.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA: gr_airplane TYPE REF TO lcl_airplane.

  "Statische Methode aufrufen

  lcl_airplane=>display_n_o_airplanes( ).

  gr_airplane = NEW #( ).  " -> neue Syntax für Create Object - Instanz erzeugen

  "Instanzmethoden aufrufen

  gr_airplane->set_airplane_name( EXPORTING iv_name = 'Airbus' ).
  gr_airplane->set_planetype( EXPORTING iv_planetype = 'Boing 747' ).
  gr_airplane->display_attributes( ).

***
  DATA gv_number_of_airplanes TYPE i.

  "Funktionale Methode aufrufen

  gv_number_of_airplanes = gr_airplane->get_n_o_airplanes( ).

  ULINE.
  WRITE: icon_yellow_light,
  / 'Counter ist gleich: ',  gv_number_of_airplanes.
