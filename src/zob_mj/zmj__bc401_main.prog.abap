*&---------------------------------------------------------------------*
*& Report zmj__bc401_main
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmj__bc401_main.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS constructor IMPORTING  iv_airplane_name TYPE string
                                   iv_planetype     TYPE saplane-planetype
                        EXCEPTIONS planetype_not_existing.  " Klassiche Exception

    METHODS set_airplane_name IMPORTING  iv_name TYPE string.

    METHODS set_planetype     IMPORTING iv_planetype TYPE saplane-planetype.

    METHODS display_attributes.

    CLASS-METHODS display_n_o_airplanes.
    CLASS-METHODS get_n_o_airplanes     RETURNING VALUE(rv_count) TYPE i.
    CLASS-METHODS get_n_o_airplanes_exp EXPORTING ev_count TYPE i.

  PRIVATE SECTION.
    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype,
          mv_weight    TYPE saplane-weight,
          mv_tankcap   TYPE saplane-tankcap.

    CLASS-DATA: gv_n_o_airplanes TYPE i.

ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD constructor.
    SELECT SINGLE
      weight,
      tankcap
    FROM saplane
    INTO @DATA(ls_plane_data)
    WHERE planetype = @iv_planetype.

    IF sy-subrc <> 0.
      RAISE planetype_not_existing. "=> Raus aus Methode
    ELSE.
      mv_weight        = ls_plane_data-weight.
      mv_tankcap       = ls_plane_data-tankcap.
      mv_name          = iv_airplane_name.
      mv_planetype     = iv_planetype.
      gv_n_o_airplanes = gv_n_o_airplanes + 1.
    ENDIF.
  ENDMETHOD.

  METHOD set_airplane_name.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD set_planetype.
    mv_planetype = iv_planetype.
  ENDMETHOD.

  METHOD display_attributes.
    WRITE: /'Airplane Name: ', mv_name.
    WRITE: /'Planetype: ', mv_planetype.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: /'Number of Airplanes: ', gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplanes.
    rv_count = gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplanes_exp.
    ev_count = gv_n_o_airplanes.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA go_airplane TYPE REF TO lcl_airplane.

  lcl_airplane=>display_n_o_airplanes( ).

*  go_airplane = NEW #( iv_planetype = 'TEST' ).
  CREATE OBJECT go_airplane
    EXPORTING
      iv_airplane_name       = 'AirBus'
      iv_planetype           = 'MD11'
    EXCEPTIONS
      planetype_not_existing = 1.
  IF sy-subrc <> 0.
    WRITE: /'Keine Daten zum PlaneType gefunden.'.
    EXIT.
  ENDIF.

  lcl_airplane=>display_n_o_airplanes( ).                     " Statische Methodenaufruf

*  go_airplane->set_airplane_name( EXPORTING iv_name = 'Airbus' ).
*  go_airplane->set_planetype( iv_planetype = 'Boing 787' ).

  go_airplane->display_attributes( ).

*  DATA gv_number_of_airplanes TYPE i.
*
*  gv_number_of_airplanes = go_airplane->get_n_o_airplanes( ). " Funktionaler Methodenaufruf
*
*  WRITE: /'Counter ist gleich: ' , gv_number_of_airplanes.
*
*  go_airplane->get_n_o_airplanes_exp(
*    IMPORTING
*      ev_count = gv_number_of_airplanes
*  ).                                                          " Instanzmethodenaufruf
*
*  WRITE: /'Counter ist gleich: ' , gv_number_of_airplanes.
