*&---------------------------------------------------------------------*
*& Report zas_bc401_main_const
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_bc401_main_const.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_name      TYPE string
                                  iv_planetype TYPE saplane-planetype.

    METHODS: display_attributes "öffentliche Instanzmethode
      EXPORTING ev_name      TYPE string
                ev_planetype TYPE saplane-planetype.

    CLASS-METHODS display_n_o_airplanes. "statische Methode

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mv_name      TYPE string, "(privates Instanzattribut), mv = member variable
          mv_planetype TYPE saplane-planetype. "(privates Instanzattribut), mv = member variable
    CLASS-DATA gv_n_o_airplanes TYPE i. "(privates statisches Attribut)

ENDCLASS.

**********************************************************************
**********************************************************************

CLASS lcl_airplane IMPLEMENTATION.

  METHOD display_attributes.
    ev_name = mv_name.
    ev_planetype = mv_planetype.
    WRITE: /'Airplane Name: ', mv_name.
    WRITE: /'Planetype: ', mv_planetype.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: / 'Number of Airplanes: ', gv_n_o_airplanes.
  ENDMETHOD.

  METHOD constructor.
    mv_name = iv_name.
    mv_planetype = iv_planetype.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    "ADD 1 TO gv_n_o_airplanes
  ENDMETHOD.

ENDCLASS.

**********************************************************************
**********************************************************************

START-OF-SELECTION.

  DATA: gv_airplane            TYPE REF TO lcl_airplane,
        gt_airplane            TYPE TABLE OF REF TO lcl_airplane,
        gv_number_of_airplanes TYPE i.

**********************************************************************
* Constructor implementieren
**********************************************************************
  gv_airplane = NEW #(
  iv_name = 'Airbus'
  iv_planetype = 'Boeing 747').

**********************************************************************
* statischer Methodenaufruf
**********************************************************************
  lcl_airplane=>display_n_o_airplanes( ).

**********************************************************************
* Instanzmethodenaufruf
**********************************************************************
  gv_airplane->display_attributes( ).

END-OF-SELECTION.
