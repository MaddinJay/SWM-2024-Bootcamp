*&---------------------------------------------------------------------*
*& Include zfd_airplane1
*&---------------------------------------------------------------------*

*******************************
* lokale klasse DEFINITION
*******************************
CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
*    Data:

    METHODS:
      constructor IMPORTING  iv_name      TYPE string
                             iv_planetype TYPE saplane-planetype
*                             iv_planeweight  TYPE saplane-weight
*                             iv_planetankcap TYPE saplane-tankcap
                  EXCEPTIONS planetype_not_existing " Klassische Exception!!
                  ,

*      set_airplane_name
*        IMPORTING iv_name TYPE string,
*
*      set_planetype
*        IMPORTING iv_planetype TYPE saplane-planetype,

      display_attributes
*        EXPORTING ev_name      TYPE string
*                  ev_planetype TYPE saplane-planetype
      .

    CLASS-METHODS:
      display_n_o_airplanes
        EXPORTING ev_n_o_airplanes TYPE i,

      get_n_o_airplanes
        RETURNING VALUE(rv_count) TYPE i,

      get_n_o_airplanes_exp
        EXPORTING ev_count TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_name TYPE string.
    DATA mv_planetype TYPE saplane-planetype.
    DATA mv_planeweight TYPE saplane-weight.
    DATA mv_planetankcap TYPE saplane-tankcap.

    CLASS-DATA gv_n_o_airplanes TYPE i.

ENDCLASS.

*******************************
* lokale Klasse IMPLEMENTATION
*******************************
CLASS lcl_airplane IMPLEMENTATION.

*  METHOD set_airplane_name.
*    mv_name = iv_name.
*  ENDMETHOD.
*
*  METHOD set_planetype.
*    mv_planetype = iv_planetype.
*  ENDMETHOD.

  METHOD display_attributes.
*    ev_name = mv_name.
*    ev_planetype = mv_planetype.
    WRITE: /,  icon_green_light.
    WRITE: /'Airplanename: ',mv_name.
    WRITE: /'Planetype: ', mv_planetype.
    WRITE: /'Planeweight: ', mv_planeweight.
    WRITE: /'Planetankcap: ', mv_planetankcap.
  ENDMETHOD.

  METHOD display_n_o_airplanes.
    gv_n_o_airplanes = ev_n_o_airplanes.
    WRITE: /, 'Number of Airplanes: ', gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplanes.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    rv_count = gv_n_o_airplanes.
  ENDMETHOD.

  METHOD get_n_o_airplanes_exp.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    ev_count = gv_n_o_airplanes.
  ENDMETHOD.

  METHOD constructor.

    SELECT SINGLE
  FROM saplane
  FIELDS weight, tankcap, planetype
  WHERE planetype = @iv_planetype
  INTO @DATA(ls_plane).

    IF sy-subrc <> 0.
      RAISE planetype_not_existing. " Raus aus der Methode!
*    DB Select Wir finden keinen Eintrag in der DB -> Exception werfen.
    ENDIF.

    mv_name = iv_name.
    mv_planetype = iv_planetype.
    mv_planeweight = ls_plane-weight.
    mv_planetankcap = ls_plane-tankcap.
    ADD 1 TO gv_n_o_airplanes.

*    IF sy-subrc <> 0.
*      RAISE planetype_not_existing. " Raus aus der Methode!
**    DB Select Wir finden keinen Eintrag in der DB -> Exception werfen.
*    ENDIF.

*    mv_name = iv_name.
*    mv_planetype = iv_planetype.
*    mv_planeweight = iv_planeweight.
*    mv_planetankcap = iv_planetankcap.
*    ADD 1 TO gv_n_o_airplanes.
  ENDMETHOD.

ENDCLASS.
