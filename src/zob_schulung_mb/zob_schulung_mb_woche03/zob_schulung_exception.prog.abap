*&---------------------------------------------------------------------*
*& Report zob_schulung_exception
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_schulung_exception.

CLASS lcl_airplane DEFINITION.


  PUBLIC SECTION.



    METHODS constructor
      IMPORTING iv_name_c            TYPE string
                "iv_planetype_c       TYPE saplane-planetype
                "iv_number_airplane_c TYPE i
Exceptions wrong_planetype.

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
   " mv_planetype = iv_planetype_c.

*    select
*    from saplane
*     fields *
*     where planetype = @iv_planetype_c
*     into table @data(gt_airplane).
*     cl_demo_output=>display( gt_airplane ).
*
*
*    ADD 1 TO gv_n_o_airplanes.

    raise wrong_planetype.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

 DATA: go_airplane TYPE REF TO lcl_airplane.

START-OF-SELECTION.
  CREATE OBJECT go_airplane
    EXPORTING
      iv_name_c = 'Airbus2'
    EXCEPTIONS wrong_planetype = 1.
  IF sy-subrc <> 0. "wenn es nicht stimmt also wenn kein flugzeugtyp gefunden wird dann zeigt es untere an:
  WRITE: / 'Es ist ein Fehler aufgetreten.'.
  EXIT.
  ENDIF.
  go_airplane->display_attributes(  ).
