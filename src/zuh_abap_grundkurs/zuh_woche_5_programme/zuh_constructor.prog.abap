*&---------------------------------------------------------------------*
*& Report zuh_constructor
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_constructor.

*******************************
* lokale klasse DEFINITION
*******************************
CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING iv_name      TYPE string
                            iv_planetype TYPE saplane-planetype.


    METHODS display_attributes.



  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_name TYPE string.
    DATA mv_planetype TYPE saplane-planetype.

    CLASS-DATA gv_n_o_airplanes TYPE i.

ENDCLASS.

*******************************
* lokale Klasse IMPLEMENTATION
*******************************
CLASS lcl_airplane IMPLEMENTATION.



  METHOD display_attributes.

    WRITE: 'Airplanename: ',mv_name.
    WRITE: 'Planetype: ', mv_planetype.
  ENDMETHOD.

  METHOD constructor.
    mv_name = iv_name.
    mv_planetype = iv_planetype.
    ADD 1 TO gv_n_o_airplanes.
  ENDMETHOD.

ENDCLASS.

*******************************
* Start Hauptprogramm
*******************************

DATA go_plane TYPE REF TO lcl_airplane.
DATA lt_tabelle TYPE TABLE OF REF TO lcl_airplane.

START-OF-SELECTION.

*******************************************************
* Befüllen des Construktor
*******************************************************
  go_plane = NEW #( iv_name = 'Die Dachau'
                    iv_planetype = 'Airbus 300'
   ).

*******************************************************
*Datenausgabe
*******************************************************
  go_plane->display_attributes( ).


  DATA gv_number TYPE i.

  DATA gv_number_of_airplanes TYPE i.
